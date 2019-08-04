//
//  NSError+Extention.swift
//  Platform Mobile
//
//  Created by larens on 16/04/2019.
//  Copyright © 2019 Project All rights reserved.
//

import Foundation

public extension NSError {
    class var emptyErrorDomain: String { return "com.project.error.default" }
    class var emptyErrorCode: Int { return 1024 }
    class var empty: NSError {
        return NSError(domain: emptyErrorDomain, code: emptyErrorCode, userInfo: nil)
    }
    
    class func make(message: String, code: Int = 9999, info: [String: Any] = [:]) -> NSError {
        var params = info
        params[NSLocalizedDescriptionKey] = message;
        params[NSLocalizedFailureReasonErrorKey] = message
        return NSError(
            domain: "com.project.error.maker",
            code: code,
            userInfo: params
        )
    }
}

public func NSErrorFrom(message: String, code: Int = 9999, info: [String: Any] = [:]) -> NSError {
    return NSError.make(message: message, code: code, info: info)
}
