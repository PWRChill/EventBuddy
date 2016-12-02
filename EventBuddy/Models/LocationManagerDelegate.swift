//
//  LocationManagerDelegate.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 01.12.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import MapKit

protocol LocationManagerDelegate {
    func didFind(new location: CLLocation)
}
