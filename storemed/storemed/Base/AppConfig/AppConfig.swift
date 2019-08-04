//
//  AppConfig.swift
//  Platform Mobile
//
//  Created by larens on 05/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import UIKit

class AppConfig: NSObject, Decodable {
    
    var colorsTheme: ColorsConfig?
    var networkSettings: NetworkSettings?

    
    enum CodingKeys: String, CodingKey {
        case colorsTheme = "colors_theme"
        case networkSettings = "network_settings"
    }
    
}
