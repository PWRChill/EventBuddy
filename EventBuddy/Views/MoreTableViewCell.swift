//
//  MoreTableViewCell.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreTableViewCell: UITableViewCell {

    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func set(groupModel model: GroupModel) {
        self.nameLabel.text = model.name
        self.pictureImageView.isHidden = true
        self.pictureImageView.image = nil
    }
    
    func set(singularObjectModel model: SingularObjectModel) {
        if let image = model.image {
            self.pictureImageView.image = UIImage(named: image)
            self.pictureImageView.isHidden = false
        }
        
        self.nameLabel.text = model.name
    }

}
