//
//  MedicalSuppliesInteractor.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesInteractor: NSObject {

    var output: MedicalSuppliesInteractorOutput?
    
}

extension MedicalSuppliesInteractor: MedicalSuppliesInteractorInput {
    
    func requestMedicalSupplies(_ query: String) {
        var filter = Filter()
        filter.query = query
        
        _ = MedicalSuppliesApi().loadMedicalSupplies(page: 1, filter: filter, success: { page in
            self.output?.sendPageCopy(page?.copy())
        }, failure: { error in
            
        })
    }
    
}

