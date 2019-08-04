//
//  BaseApi.swift
//  TableView Template
//
//  Created by larens on 01/03/2019.
//  Copyright © 2019 larens. All rights reserved.
//

import Alamofire

class BaseApi: NSObject {
    
    static var alamoFireManager : SessionManager?
    
    override init() {
        super.init()
        if BaseApi.alamoFireManager == nil {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 120;
            BaseApi.alamoFireManager = Alamofire.SessionManager(configuration: configuration)
        }
    }
    
    open func preparedParams(parameters: [String: Any]?) -> [String: Any]? {
        var requestParameters = parameters ?? [String: Any]()
        
        requestParameters["client_id"] = App.shared.appConfig?.networkSettings?.clientId
        requestParameters["client_secret"] = App.shared.appConfig?.networkSettings?.clientSecret
        
        return requestParameters
    }

    open func preparedHeaders() -> HTTPHeaders? {
        return nil;
    }
    
    open func request(method: HTTPMethod, url: String, parameters: [String: Any]?, success: @escaping ((_ data: Any, _ code: Int? ) -> Swift.Void), failure: @escaping ((_ error: NSError) -> Swift.Void)) -> DataRequest?  {
        return request(method: method, url: url, parameters: parameters, encoding: URLEncoding.default, success: success, failure: failure)
    }
    
    open func request(method: HTTPMethod, url: String, parameters: [String: Any]?, encoding: ParameterEncoding?, success: @escaping ((_ data: Any, _ code: Int? ) -> Swift.Void), failure: @escaping ((_ error: NSError) -> Swift.Void)) -> DataRequest?  {
        
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 120;
//        let manager = Alamofire.SessionManager(configuration: configuration)
//
        guard let serverUrl = App.shared.appConfig?.networkSettings?.apiUrlString else {
            failure(NSErrorFrom(message: "API Error"))
            return nil
        }
        
        
        let requestParameters = self.preparedParams(parameters: parameters)
        let requestUrl = "\(serverUrl)\(url)"
        let requestEncoding = (encoding == nil) ? URLEncoding.default : encoding
        let req = BaseApi.alamoFireManager?.request(requestUrl, method: method, parameters: requestParameters, encoding:  requestEncoding!, headers: self.preparedHeaders()).validate(contentType: ["application/json"]).responseData { (responseData) in
            switch responseData.result {
            case .success(let value):
                success(value, responseData.response?.statusCode)
            case .failure(let error):
                failure(error as NSError)
            }
        }
        
        return req
    }
    
    open func request(method: HTTPMethod, url: String, fileData: Data?, fileName: String?, fileType: String?, parameters: [String: Any]?, success: @escaping ((_ data: Any, _ code: Int? ) -> Swift.Void), failure: @escaping ((_ error: NSError) -> Swift.Void), encodingCompletion: ((_ request: UploadRequest) -> Swift.Void)?)  {
//        let configuration = URLSessionConfiguration.default
//        configuration.timeoutIntervalForRequest = 120;
//        let manager = Alamofire.SessionManager(configuration: configuration)
        
        guard let serverUrl = App.shared.appConfig?.networkSettings?.apiUrlString else {
            failure(NSErrorFrom(message: "API Error"))
            return
        }
        
        let requestParameters = self.preparedParams(parameters: parameters)
        let requestUrl = "\(serverUrl)\(url)"
        
        var headers: HTTPHeaders = self.preparedHeaders() ?? HTTPHeaders()
        headers["Content-type"] = "multipart/form-data"
        
        
        BaseApi.alamoFireManager?.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in requestParameters ?? [String: Any]() {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            
            if let data = fileData, let name = fileName, let type = fileType {
                multipartFormData.append(data, withName: "file", fileName: name, mimeType: type)
            }
            
        }, usingThreshold: UInt64.init(), to: requestUrl, method: method, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.validate().responseData(completionHandler: { (responseData) in
                    switch responseData.result {
                    case .success(let value):                        
                        success(value, responseData.response?.statusCode)
                    case .failure(let error):
                        failure(error as NSError)
                    }
                })
                encodingCompletion?(upload)
            case .failure(let error):
                failure(error as NSError)
            }
        }
    }
    
    
    
    func json(from object:Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}
