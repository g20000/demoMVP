//
//  MedicalSuppliesApi.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Alamofire

class NewsApi: BaseApi {

    func loadNews(success: @escaping ((_ data: [Article]?) -> Void), failure: @escaping ((_ error: NSError) -> Void)) -> DataRequest? {
        return self.request(method: .get, url: "", parameters: nil, success: { (rawData, code) in
            guard let data = rawData as? Data else {
                failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Invalid response"]))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            do {
                let response = try decoder.decode(ManyItems<Article>.self, from: data)
                if response.status == "ok" {
                    success(response.items)
                } else {
                    failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : response.message ?? "Invalid response"]))
                }
            } catch {
                failure(error as NSError)
                return
            }
            
        }, failure: { (error) in
            failure(error)
        })
    }
    
}
