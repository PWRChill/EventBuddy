//
//  GroupModel.swift
//  EventBuddy
//
//  Created by Axel Nowaczyk on 22.10.2016.
//  Copyright © 2016 Axel Nowaczyk. All rights reserved.
//

import Foundation
import RealmSwift

class GroupModel: BaseModel {
    
    dynamic var name: String?
    let dogs = List<SingularObjectModel>()
    
}
