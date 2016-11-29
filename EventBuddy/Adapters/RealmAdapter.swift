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
    
    static func deleteAll(){
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    
    static func setupData(handler: () -> Void) {
        
        let foods = GroupModel.groupModel(name: "Food", models: nil)

        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "plac Grunwaldzki 22, 50-384 Wrocław", desc: nil, lat: 51.112450, lon: 17.059697, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "plac Grunwaldzki 34, 50-001 Wrocław", desc: nil, lat: 51.114623, lon: 17.069643, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "Galeria Dominikańska, plac Dominikański 3, 11-400 Wrocław", desc: nil, lat: 51.108359, lon: 17.040417, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "Rynek 30, 11-400 Wrocław", desc: nil, lat: 51.109308, lon: 17.033197, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "Krakowska 6/7, 50-001 Wrocław", desc: nil, lat: 51.095787, lon: 17.056210, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "Wrocław Główny, Piłsudskiego 105, 50-085 Wrocław", desc: nil, lat: 51.098847, lon: 17.036201, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: "McDonald's", address: "Księcia Witolda 6, 50-001 Wrocław", desc: nil, lat: 51.116311, lon: 17.024184, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "plac Grunwaldzki 22, 50-384 Wrocław", desc: nil, lat: 51.112450, lon: 17.059697, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "aleja Marcina Kromera 18, 51-163 Wrocław", desc: nil, lat: 51.131673, lon: 17.061961, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Galeria Dominikańska, plac Dominikański 3, 51-159 Wrocław", desc: nil, lat: 51.108359, lon: 17.040417, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Świdnicka 13, 50-066 Wrocław", desc: nil, lat: 51.107598, lon: 17.032065, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Piłsudskiego 105, 50-085 Wrocław", desc: nil, lat: 51.098847, lon: 17.036201, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Arkady Wrocławskie, Powstańców Śląskich 2/4, 53-333 Wrocław", desc: nil, lat: 51.099786, lon: 17.028688, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Bardzka 6, 50-001 Wrocław", desc: nil, lat: 51.083617, lon: 17.050416, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "aleja Hallera 52, 50-984 Wrocław", desc: nil, lat: 51.088342, lon: 16.999094, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: "KFC", address: "Centrum Handlowe Korona, Bolesława Krzywoustego 126, 51-312 Wrocław", desc: nil, lat: 51.141844, lon: 17.087423, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Las/Zupa", image: "LasZupa", address: "ul. Igielna 14", desc: nil, lat: 51.111474, lon: 17.031804, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Patelnia", image: "Patelnia", address: "ul. Kuźnicza 29A", desc: nil, lat: 51.112754, lon: 17.034638, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Machina Organika", image: "MachinaOrganika", address: " ul. Ruska 19", desc: nil, lat: 51.110550, lon: 17.026053, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Aquarelle", image: "Aquarelle", address: "ul. Purkyniego 10 (Radisson Blu Hotel Wroclaw)", desc: nil, lat: 51.110898, lon: 17.044176, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Bernard", image: "Bernard", address: "Rynek 35", desc: nil, lat: 51.110003, lon: 17.033414, rank: 0))


        







        
        
        
        
        
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Orient Express", image: nil, address: "plac Grunwaldzki 22, 50-384 Wrocław", desc: nil, lat: 51.112450, lon: 17.059697, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kebab", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kepap", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        RealmAdapter.save(model: foods)
        
        let entertainments = GroupModel.groupModel(name: "Entertainment", models: nil)
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Cinema City", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Multikino", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Teatr Wspolczesny", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        RealmAdapter.save(model: entertainments)
        
        let sports = GroupModel.groupModel(name: "Sport", models: nil)
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Running", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Swimming pool", image: nil, address: nil, desc: nil, lat: 0, lon: 0, rank: 0))
        RealmAdapter.save(model: sports)
        
        handler()
    }
    
    
    static func getData(for text: String) -> [GroupModel] {
        
        var results = [GroupModel]()

        for groupModel in Array(RealmAdapter.fetchModels(GroupModel.self)) {
            if let searchResult = groupModel.applySearch(using: text) {
                results.append(searchResult)
            }

        }
        
        return results
    }
    
}
