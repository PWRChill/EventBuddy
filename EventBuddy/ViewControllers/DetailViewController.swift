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
    
    let regionRadius: CLLocationDistance = 1000
    
    var model: SingularObjectModel?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let model = self.model {
            self.setup(model: model)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        print("memory warning")
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 1.0, regionRadius * 1.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
    }

    private func setup(model: SingularObjectModel) {
        print(model)
        
        let name = String.getName(for: model.name)
        let address = String.getAddress(for: model.address)
        let desc = String.getDescription(for: model.desc)
        let img = UIImage.getPicture(for: model.image)
        
        self.nameLabel.text = name
        self.addressLabel.text = address
        self.descriptionLabel.text = desc
        self.pictureImageView.image = img
        
        if let latitude = model.lat.value,
            let longitude = model.lon.value {
            let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
            self.centerMapOnLocation(location: mapView.userLocation.location ?? initialLocation)
            let artwork = MapObjectModel(title: name,
                                  locationName: address,
                                  coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            mapView.addAnnotation(artwork)
        }

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


