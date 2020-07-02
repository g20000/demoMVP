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
    
    func requestMedicalSupplies(currentPageNumber: Int) {
        _ = NewsApi().loadNews(page: currentPageNumber, success: { articles in
            print(currentPageNumber)
            self.output?.sendNewsCopy(articles)
        }, failure: { error in
            self.output?.sendErrorInfo(error.description)
        })
    }
    
}

