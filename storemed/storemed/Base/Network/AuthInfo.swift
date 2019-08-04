//
//  AuthInfo.swift
//  Platform Mobile
//
//  Created by larens on 17/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import UIKit

class AuthInfo: NSObject, Codable {
    var accessToken: String?
    var refreshToken: String?
    var expiresIn: Int?
    var tokenType: String?
    
    var status: Int?
    var message: String?
}
