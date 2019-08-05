//
//  ResponseModel.swift
//  Platform Mobile
//
//  Created by larens on 17/04/2019.
//  Copyright © 2019 Platform Mobile. All rights reserved.
//

import UIKit

class ResponseModel<Item: Codable>: NSObject, Codable {
    
    var status: String?
    var code: Int?
    var message: String?
    var result: Item?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case code = "code"
        case message = "message"
        case result = "result"
    }
    
}
