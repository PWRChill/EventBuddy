//
//  SingularObjectModel.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import RealmSwift

class SingularObjectModel: BaseModel {
    
    dynamic var name: String?
    dynamic var image: NSDate?
    dynamic var address: String?
    dynamic var desc: String?
    
    let lat = RealmOptional<Double>()
    let lon = RealmOptional<Double>()
    
    
}
