//
//  Developper.swift
//  devTrombi
//
//  Created by celine dann on 16/05/2019.
//  Copyright © 2019 celine dann. All rights reserved.
//

import Foundation

class Developer: Codable {
    var id: Int
    var name: String
    var description: String
    var picture: String
    var hired: Bool
    
    init(id: Int, name: String, description: String, picture: String, hired: Bool) {
        self.id = id
        self.name = name
        self.description = description
        self.picture = picture
        self.hired = hired
    }
}
