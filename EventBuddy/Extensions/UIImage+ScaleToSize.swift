//
//  UIImage+ScaleToSize.swift
//  EventBuddy
//
//  Created by Rafał Wycichowski on 16/11/2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func scale(to size:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0);
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}

