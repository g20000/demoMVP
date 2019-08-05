//
//  MedicalSuppliesApi.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Alamofire

class MedicalSuppliesApi: BaseApi {

    func loadMedicalSupplies(page: Int, filter: Filter, success: @escaping ((_ data: Page?) -> Void), failure: @escaping ((_ error: NSError) -> Void)) -> DataRequest? {
        return self.request(method: .get, url: "", parameters:["page": page, "filter": ["perPage": filter.amountOfItems], "q": filter.query], success: { (rawData, code) in
            guard let data = rawData as? Data else {
                failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Invalid response"]))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            do {
                let response = try decoder.decode(ResponseModel<Page>.self, from: data)
                if response.status == "ok" {
                    success(response.result)
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
