//
//  App.swift
//  Platform Mobile
//
//  Created by larens on 05/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import UIKit

class App: NSObject {
    
    private let authInfoKey = "authInfoKey"
    
    static let shared = App()
    
    var appConfig: AppConfig?
    private var _authInfo: AuthInfo?
    var authInfo: AuthInfo? {
        get {
            if _authInfo == nil {
                let defaults = UserDefaults.standard
                if let savedAuthInfo = defaults.object(forKey: authInfoKey) as? Data {
                    let decoder = JSONDecoder()
                    if let loadedAuthInfo = try? decoder.decode(AuthInfo.self, from: savedAuthInfo) {
                        _authInfo = loadedAuthInfo
                    }
                }
            }
            
            return _authInfo
        }
        set {
            let defaults = UserDefaults.standard
            if newValue == nil {
                defaults.set(nil, forKey: authInfoKey)
            }
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                defaults.set(encoded, forKey: authInfoKey)
            }
            _authInfo = newValue
        }
    }
    
    var currentUser: User?
    
    private override init() {
        if let path = Bundle.main.path(forResource: "AppConfig", ofType: "plist") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = PropertyListDecoder()
                appConfig = try decoder.decode(AppConfig.self, from: data)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func loadConfig() {
        if let path = Bundle.main.path(forResource: "AppConfig", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let config = try JSONDecoder().decode(AppConfig.self, from: data).colorsTheme
                self.appConfig?.colorsTheme = config
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
    
}
