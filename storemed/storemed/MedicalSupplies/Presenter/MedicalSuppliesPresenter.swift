//
//  MedicalSuppliesPresenter.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesPresenter: NSObject {
    
    var view: MedicalSuppliesView?
    var interactor: MedicalSuppliesInteractorInput?
    
    var page: Page?
    
    func updateView(_ query: String) {
        interactor?.requestMedicalSupplies(query)
    }
    
}

extension MedicalSuppliesPresenter: MedicalSuppliesInteractorOutput {
    
    func sendPageCopy(_ page: Page?) {
        showMedicalSupplies(page?.items)
    }
    
    func showMedicalSupplies(_ items: Array<MedicalSupply>?) {
        view?.showMedicalSupplies(items)
    }
    
}

