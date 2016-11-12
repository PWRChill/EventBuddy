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
    
    static var isDataStorred: Bool {
        return !self.fetchModels(GroupModel.self).isEmpty
    }
    
    static func save<T: BaseModel>(model: T) {
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
    
    
    static func setupData(handler: () -> Void) {
        
        let foods = GroupModel.groupModel(name: "Food", models: nil)
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Orient Express", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kebab", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kepap", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.save(model: foods)
        
        let entertainments = GroupModel.groupModel(name: "Entertainment", models: nil)
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Cinema City", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Multikino", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Teatr Wspolczesny", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.save(model: entertainments)
        
        let sports = GroupModel.groupModel(name: "Sport", models: nil)
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Running", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Swimming pool", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.save(model: sports)
        
        handler()
    }
    
}
