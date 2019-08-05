//
//  NetworkSettings.swift
//  Platform Mobile
//
//  Created by larens on 16/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import UIKit

class NetworkSettings: NSObject, Decodable {
    
    var apiUrlString: String?
    var token: String?
    
    var apiUrl: URL? {
        get {
            guard let urlString = apiUrlString else {
                return nil
            }
            return URL(string: urlString)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case apiUrlString = "api_url"
        case token = "token"
    }

}
