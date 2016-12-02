//
//  DetailViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 12.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

class DetailViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var pictureImageView: UIImageView!
    
    @IBOutlet var mapView: MKMapView!
    
    @objc
    func mapWasTapped() {
        self.shouldUpdateMap = false
        self.mapView.removeGestureRecognizer(eb)
    }
    let regionRadius: CLLocationDistance = 1000
    private let eb = EBGestureRecognizer()
    private var placeLocation: CLLocation? {
        didSet {
            self.updateDisatenceLabel()
        }
    }
    
    var shouldUpdateMap = true
    var userLocation: CLLocation? {
        didSet {
            self.updateDisatenceLabel()
        }
    }
    
    var model: SingularObjectModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self

        LocationManager.shared.delegate = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let model = self.model {
            self.setup(model: model)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        eb.addTarget(self, action: #selector(mapWasTapped))
        self.mapView.addGestureRecognizer(eb)
        LocationManager.startUpdatingLocation()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        LocationManager.stopUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("memory warning")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 1.0, regionRadius * 1.0)
        mapView.setRegion(coordinateRegion, animated: false)
        
    }

    private func setup(model: SingularObjectModel) {
        
        let name = String.getName(for: model.name)
        let address = String.getAddress(for: model.address)
        let desc = String.getDescription(for: model.desc)
        let img = UIImage.getPicture(for: model.image)
        
        self.nameLabel.text = name
        self.addressLabel.text = address
        self.descriptionLabel.text = desc
        self.pictureImageView.image = img
        self.userLocation = LocationManager.location
        
        if let latitude = model.lat.value,
            let longitude = model.lon.value {
            self.placeLocation = CLLocation(latitude: latitude, longitude: longitude)
            self.centerMapOnLocation(location: LocationManager.location ?? self.placeLocation!)
            let artwork = MapObjectModel(title: name,
                                  locationName: address,
                                  coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            mapView.addAnnotation(artwork)
        }

    }
    
    private func updateDisatenceLabel() {
        guard   let ul = self.userLocation,
                let pl = self.placeLocation else {
            return
        }
        
        self.distanceLabel.text = ul.distance(from: pl).rounded().description + " m"
        self.drawPath()
        
    }
    
    private func drawPath() {
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.userLocation!.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.placeLocation!.coordinate))
        request.transportType = .walking
        request.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: request)
        
        directions.calculate {
            (response, error) -> Void in
            
            guard let response = response else {
                return
            }
            
            for overlay in self.mapView.overlays {
                self.mapView.remove(overlay)
            }
            
            let route = response.routes[0]
            self.mapView.add(route.polyline, level: .aboveRoads)

            if self.shouldUpdateMap {
                let rect = route.polyline.boundingMapRect.scaleToFitMap()
                self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: false)
            }

        }
        
    }
    
}

extension DetailViewController: LocationManagerDelegate {
    func didFind(new location: CLLocation) {
        self.userLocation = location
    }
}

extension DetailViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }

}
private extension MKMapRect {
    func scaleToFitMap() -> MKMapRect {
        return MKMapRect(
            origin: self.origin,
            size: MKMapSize(
                width: self.size.width * 2,
                height: self.size.height * 2))
    }
}

private extension UIImage {
    
    static func getPicture(for name: String?) -> UIImage {
        return UIImage(named: name ?? "no_img_ava_image")!
    }
    
}

private extension String {
    
    static func getName(for text: String?) -> String {
        return text ?? "Unknown name"
    }

    static func getAddress(for text: String?) -> String {
        return text ?? "Unknown address"
    }
    
    static func getDescription(for text: String?) -> String {
        return text ?? "No description"
    }
    
}


