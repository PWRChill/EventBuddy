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

    private func setup(model: SingularObjectModel) {

        self.nameLabel.text = model.name ?? "Unknown name"
        self.addressLabel.text = model.address ?? "Unknown address"
        self.descriptionLabel.text = model.desc ?? "No description"
        self.pictureImageView.image = UIImage(named: model.image ?? "no_img_ava_image")
    }
}
