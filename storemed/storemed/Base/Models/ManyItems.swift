//
//  ManyItems.swift
//  Platform Mobile
//
//  Created by larens on 18/04/2019.
//  Copyright © 2019 Platform Mobile. All rights reserved.
//

import Foundation

class ManyItems<Type: Codable >: NSObject, Codable {
    
    var count: Int?
    var total: Int?
    var items: [Type]?
    
    enum CodingKeys: String, CodingKey {
        case count
        case total
        case items
    }
    
}
