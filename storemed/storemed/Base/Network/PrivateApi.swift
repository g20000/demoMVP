//
//  PrivateApi.swift
//  Platform Mobile
//
//  Created by larens on 17/04/2019.
//  Copyright © 2019 Platform Mobile. All rights reserved.
//

import Alamofire

class PrivateApi: BaseApi {
    
    override func preparedHeaders() -> HTTPHeaders? {
        var requestHeaders = HTTPHeaders.init()
        
        guard let authInfo = App.shared.authInfo,
            let tokenType = authInfo.tokenType,
            let accessToken = authInfo.accessToken else {
                return nil
        }
        
        requestHeaders["Authorization"] = "\(tokenType) \(accessToken)"
        
        return requestHeaders
    }

}
