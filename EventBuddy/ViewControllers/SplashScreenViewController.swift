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

        if !RealmAdapter.isDataStorred {
            self.setupAllData {
                self.performSegueToTabBarController()
            }
        } else {
            self.performSegueToTabBarController()
        }
    
    }

    private func setupAllData(handler: () -> Void) {

        RealmAdapter.setupData(handler: handler)
        
    }
    
    private func performSegueToTabBarController() {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "StartApp", sender: self)
        }
    }

}
