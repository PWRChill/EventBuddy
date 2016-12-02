//
//  EBGestureRecognizer.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 01.12.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import UIKit.UIGestureRecognizerSubclass

class EBGestureRecognizer: UIGestureRecognizer {
    
    override func reset() {
        super.reset()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        self.state = .recognized

    }
    
}
