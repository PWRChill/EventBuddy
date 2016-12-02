//
//  LocationManager.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 01.12.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import MapKit
class LocationManager: NSObject {

    public static let shared = LocationManager()
    private var manager = CLLocationManager()
    public var delegate: LocationManagerDelegate?
    
    public static var location: CLLocation? {
        return self.shared.manager.location
    }
    
    override init() {
        super.init()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.manager.requestAlwaysAuthorization()
        }
        manager.delegate = self
        manager.startUpdatingLocation()
    }
    
    public static func startUpdatingLocation() {
        self.shared.manager.startUpdatingLocation()
    }
    
    public static func stopUpdatingLocation() {
                self.shared.manager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first {
            self.delegate?.didFind(new: location)
        }
        
    }
}
