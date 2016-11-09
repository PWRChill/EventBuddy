//
//  GameViewController.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 09.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBAction func viewWasSwiped(_ sender: UISwipeGestureRecognizer) {
        
        switch sender.direction {
            
        case UISwipeGestureRecognizerDirection.right:
            print("right swipe")
        case UISwipeGestureRecognizerDirection.left:
            print("left swipe")
        default:
            print("Unknown direction")
        }
        
    }
    
    @IBAction func viewWasTapped(_ sender: UITapGestureRecognizer) {
        print("tap")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
