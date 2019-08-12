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
    
    func requestMedicalSupplies(_ query: String, currentPageNumber: Int) {
        var filter = Filter()
        filter.query = query
        
        let requiredPageNumber = currentPageNumber + 1
        _ = MedicalSuppliesApi().loadMedicalSupplies(page: requiredPageNumber, filter: filter, success: { page in
            self.output?.sendPageCopy(page?.copy())
        }, failure: { error in
            self.output?.sendErrorInfo(error.description)
        })
    }
    
}

