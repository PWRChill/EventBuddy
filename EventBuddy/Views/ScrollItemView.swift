//
//  ScrollItemView.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 12.11.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import UIKit

class ScrollItemView: UIView {

    @IBOutlet var pictureImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ScrollItemView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    class func scrollItemView(model: SingularObjectModel) -> ScrollItemView {
        
        let scrollItem = ScrollItemView.instanceFromNib() as! ScrollItemView
        
        if let image = model.image {
            scrollItem.pictureImageView.image = UIImage(named: image)
        }
        
        scrollItem.nameLabel.text = model.name
        scrollItem.addressLabel.text = model.address
        
        return scrollItem
        
    }

}
