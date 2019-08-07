//
//  MedicalSuppliesInteractor.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesInteractor: NSObject, MedicalSuppliesInteractorInput {

    weak var output: MedicalSuppliesInteractorOutput?
    
    func requestMedicalSupplies(_ query: String) {
        var filter = Filter()
        filter.query = query
        
        _ = MedicalSuppliesApi().loadMedicalSupplies(page: 0, filter: filter, success: { page in
            
        }, failure: { error in
            
        })
    }
    
    
    
}
