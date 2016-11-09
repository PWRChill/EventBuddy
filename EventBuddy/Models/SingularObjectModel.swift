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
    dynamic var image: String?
    dynamic var address: String?
    dynamic var desc: String?
    
    var lat = RealmOptional<Double>()
    var lon = RealmOptional<Double>()
    
    static func singularObjectModel(name: String, image: String?, address: String?, desc: String?,
                                    lat: RealmOptional<Double>?, lon: RealmOptional<Double>?) -> SingularObjectModel {
        
        let singularObjectModel = SingularObjectModel()
        singularObjectModel.name = name
        singularObjectModel.image = image
        singularObjectModel.address = address
        singularObjectModel.desc = desc
        
        if  let lat = lat,
            let lon = lon {
            
            singularObjectModel.lat = lat
            singularObjectModel.lon = lon
        }

        return singularObjectModel
    }
    
    
}
