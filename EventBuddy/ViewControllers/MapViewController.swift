//
//  MapViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 04/12/16.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!
    
    @objc
    func mapWasTapped() {
        self.shouldUpdateMap = false
        self.mapView.removeGestureRecognizer(eb)
    }
    
    private let eb = EBGestureRecognizer()
    var userLocation: CLLocation? {
        didSet {
            self.updateMap()
        }
    }
    var destinationLocation: CLLocation? {
        didSet {
            self.updateMap()
        }
    }
    var shouldUpdateMap = true
    var titleString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        LocationManager.shared.delegate = self
        eb.addTarget(self, action: #selector(mapWasTapped))
        self.mapView.addGestureRecognizer(eb)
        LocationManager.startUpdatingLocation()
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let title = self.titleString {
            self.title = title
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        LocationManager.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    private func updateMap() {
        guard   self.userLocation != nil &&
                self.destinationLocation != nil else {
            return
        }
        self.drawPath()
    }
    
    private func drawPath() {
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: self.userLocation!.coordinate))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: self.destinationLocation!.coordinate))
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
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: false)
            }
            
        }
        
    }
}

extension MapViewController: LocationManagerDelegate {
    func didFind(new location: CLLocation) {
        self.userLocation = location
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        renderer.strokeColor = UIColor.blue
        return renderer
    }
    
}
