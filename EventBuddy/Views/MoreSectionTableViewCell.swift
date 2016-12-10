//
//  MoreSectionTableViewCell.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 08/12/16.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class MoreSectionTableViewCell: UITableViewCell {

    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    func set(singularObjectModel model: SingularObjectModel) {
        if let image = model.image {
            self.pictureImageView.image = UIImage(named: image)
        }
        
        self.nameLabel.text = model.name
    }

}
