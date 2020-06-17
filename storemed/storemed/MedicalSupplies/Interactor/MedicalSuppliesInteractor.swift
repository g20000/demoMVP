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
    
    func requestMedicalSupplies() {
        _ = NewsApi().loadNews( success: { articles in
            self.output?.sendNewsCopy(articles)
            print("")
        }, failure: { error in
            self.output?.sendErrorInfo(error.description)
        })
    }
    
}

