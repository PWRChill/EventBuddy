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
    var rank = RealmOptional<Double>()
    
    static func singularObjectModel(name: String, image: String?, address: String?, desc: String?,
                                    lat: Double?, lon: Double,rank: Double) -> SingularObjectModel {
        
        let singularObjectModel = SingularObjectModel()
        singularObjectModel.name = name
        singularObjectModel.image = image
        singularObjectModel.address = address
        singularObjectModel.desc = desc
        singularObjectModel.lat.value = lat
        singularObjectModel.lon.value = lon
        singularObjectModel.rank.value = rank



        return singularObjectModel
    }
    
    
}
