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
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Jatomi Fitness", image: "JatomiFitness", address: "plac Grunwaldzki 22, 50-363 Wrocław", desc: "gym", lat: 51.112686, lon: 17.059022, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Klub sportowy Forma", image: "KlubSportowyForma", address: "Wygodna 1, 50-323 Wrocław", desc: "gym", lat: 51.122728, lon: 17.047582, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Fitness Błękitna Laguna", image: "FitnessBlekitnaLaguna", address: "Słowiańska 39, 48-300 Wrocław", desc: "gym", lat: 51.123686, lon: 17.043966, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Centrum Treningowe Spartan WCT4 Wrocław", image: "CentrumTreningoweSpartan", address: "Trzebnicka 33, 50-231 Wrocław", desc: "gym", lat: 51.127296, lon: 17.036427, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Fitness World - Wrocław, Psie Pole", image: "FitnessWorldWrocławPsiePole", address: "Jana Długosza 34, 51-162 Wrocław", desc: "gym", lat: 51.133288, lon: 17.062001, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Klub Bodyfit Fitness - Centrum Śródmieście", image: "KlubBodyfitFitness", address: "Plac Maksa Borna 1A, 50-001 Wrocław", desc: "gym", lat: 51.117477, lon: 17.028448, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Platinium Sports Center", image: "PlatiniumSportsCenter", address: "Kazimierska 15, 51-657 Wrocław", desc: "gym", lat: 51.104483, lon: 17.093097, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Marta Tymoszewicz - Fitness Studio", image: "MartaTymoszewiczFitnessStudio", address: "Jana Ewangelisty Purkyniego 10, 48-300 Wrocław", desc: "gym", lat: 51.110898, lon: 17.044176, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Klub Fitness Academy Wrocław Stare Miasto / Galeria ", image: "KlubFitnessAcademyWrocławStareMiastoGaleria ", address: "Galeria Dominikańska, plac Dominikański 3, 50-159 Wrocław", desc: "gym", lat: 51.108439, lon: 17.040524, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Jatomi Fitness", image: "JatomiFitness", address: "Renoma, Świdnicka 40, 50-086 Wrocław", desc: "gym", lat: 51.103582, lon: 17.031778, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Ultrafit Fitness", image: "UltrafitFitness", address: "3U, Kościuszki 117, 50-442 Wrocław", desc: "gym", lat: 51.099720, lon: 17.046158, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Klub Bodyfit Fitness & Wellness - Centrum Krzyki", image: "KlubBodyfitFitnessWellnessCentrumKrzyki", address: "Bernarda Pretficza 37, 11-400 Wrocław", desc: "gym", lat: 51.091855, lon: 17.006956, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Klub Fitness Academy Wrocław Arkady", image: "KlubFitnessAcademyWrocławStareMiastoGaleria", address: "Powstańców Śląskich 2, 53-333 Wrocław", desc: "gym", lat: 51.099323, lon: 17.028845, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Euro Mart", image: "EuroMart", address: "Boczna 12, 50-001 Wrocław", desc: "gym", lat: 51.092739, lon: 17.045323, rank: 0))
        
         sports.add(model: SingularObjectModel.singularObjectModel(name: "Fitness Academy Jupiter", image: "KlubFitnessAcademyWrocławStareMiastoGaleria", address: "Żegiestowska 11, 50-542 Wrocław", desc: "gym", lat: 51.082326, lon: 17.038825, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Music & Motion Pole Dance | Szarfy | Taniec na kole Wrocław", image: "MusicMotionPoleDance", address: "Nyska 59, 50-505 Wrocław", desc: "gym", lat: 51.087236, lon: 17.053927, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Wrocławski Park Wodny S.A.", image: "WroclawskiParkWodny", address: "Borowska 99, 50-558 Wrocław", desc: "gym", lat: 51.090943, lon: 17.032314, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Centrum Treningowe Spartan WCT5 Wrocław", image: "CentrumTreningoweSpartan", address: "Spiska 1, 50-562 Wrocław", desc: "gym", lat: 51.085267, lon: 17.031267, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Fitness24Seven", image: "Fitness24Seven", address: "Ślężna 130, 53-111 Wrocław", desc: "gym", lat: 51.080984, lon: 17.023525, rank: 0))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Sport Klub Tęcza", image: "TeczaSportKlub", address: "Tęczowa 79, 11-400 Wrocław", desc: "gym", lat: 51.104922, lon: 17.010306, rank: 0))
        
        
        
        
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
