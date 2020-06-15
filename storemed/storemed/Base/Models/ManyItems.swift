//
//  ManyItems.swift
//  Platform Mobile
//
//  Created by larens on 18/04/2019.
//  Copyright © 2019 Platform Mobile. All rights reserved.
//

import Foundation

class ManyItems<Type: Codable >: NSObject, Responsable {
    
    var status: String?
    var code: Int?
    var message: String?
    var count: Int?
    var total: Int?
    var items: [Type]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case count
        case total
        case items = "articles"
    }
}
