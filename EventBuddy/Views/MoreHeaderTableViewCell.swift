//
//  MoreHeaderTableViewCell.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet var sectionTitleButton: UIButton!
    @IBOutlet var arrowImageView: UIImageView!
   
    var isOppened = false {
        didSet {
            if self.isOppened {
                self.arrowImageView.image = UIImage(named: "arrow_up")
            } else {
                self.arrowImageView.image = UIImage(named: "arrow_down")
            }
        }
    }
}
