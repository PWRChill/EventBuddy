//
//  RealmAdapter.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 09.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import RealmSwift

class RealmAdapter {
    
    static let realm = try! Realm()
    
    static func saveModel<T: BaseModel>(model: T) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    static func fetchModels<T: BaseModel>(_ forClass: T.Type, filter: String? = nil) -> Results<T> {

        if let filter = filter {
            return realm.objects(forClass).filter(filter)
        } else {
            return realm.objects(forClass)
        }
        
    }
    
    static func addSingularOMToGroup(with name: String, model: SingularObjectModel) {
        
        if let gm = RealmAdapter.fetchModels(GroupModel.self, filter: "name = \(name)").first {
            try! realm.write {
                gm.models.append(model)
            }
        } else {
            print("name \(name) for class GroupModel wasnt found")
        }
        
    }
    
    
    

    
}
