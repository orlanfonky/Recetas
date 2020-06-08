//
//  Recipe.swift
//  recetas
//
//  Created by Orlando Abaunza Ubaque on 4/06/20.
//  Copyright © 2020 Orlando Abaunza Ubaque. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name: String!
    var image: UIImage!
    var time:Int!
    var ingredientes:[String]!
    var steps: [String]!
    
    var isFavourite: Bool = false
    
    init(name:String, image: UIImage, time:Int,ingredientes:[String],steps:[String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredientes = ingredientes
        self.steps = steps
    }
}
