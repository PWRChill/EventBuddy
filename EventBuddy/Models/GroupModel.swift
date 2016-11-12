//
//  GroupModel.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import RealmSwift

class GroupModel: BaseModel {
    
    dynamic var name: String!
    let models = List<SingularObjectModel>()
    
    static func groupModel(name: String, models: List<SingularObjectModel>?) -> GroupModel {
    
        let groupModel = GroupModel()
        groupModel.name = name
        
        if let models = models {
            groupModel.models.append(objectsIn: models)
        }
        
        return groupModel
    }
    
    func add(model sm: SingularObjectModel) {
        self.models.append(sm)
    }
    
}
