//
//  SplashScreenViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 12.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if RealmAdapter.fetchModels(GroupModel.self).isEmpty {
            self.setupAllData {
                self.performSegueToTabBarController()
            }
        } else {
            self.performSegueToTabBarController()
        }
    
    }

    private func setupAllData(handler: () -> Void) {

        let foods = GroupModel.groupModel(name: "Food", models: nil)
        foods.add(model: SingularObjectModel.singularObjectModel(name: "McDonalds", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "KFC", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Orient Express", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kebab", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        foods.add(model: SingularObjectModel.singularObjectModel(name: "Sevi Kepap", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.saveModel(model: foods)
        
        let entertainments = GroupModel.groupModel(name: "Entertainment", models: nil)
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Cinema City", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Multikino", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        entertainments.add(model: SingularObjectModel.singularObjectModel(name: "Teatr Wspolczesny", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.saveModel(model: entertainments)
        
        let sports = GroupModel.groupModel(name: "Sport", models: nil)
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Running", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        sports.add(model: SingularObjectModel.singularObjectModel(name: "Swimming pool", image: nil, address: nil, desc: nil, lat: nil, lon: nil))
        RealmAdapter.saveModel(model: sports)
        
    }
    
    private func performSegueToTabBarController() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "StartApp", sender: self)
        }
    }

}
