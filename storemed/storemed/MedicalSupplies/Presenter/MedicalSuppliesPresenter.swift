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
    
    private var page: Page?
    
    func updateView(_ query: String) {
        let currentPageNumber = (page != nil) ? page?.pageNumber : 0
        interactor?.requestMedicalSupplies(query, currentPageNumber: currentPageNumber!)
    }
    
}

extension MedicalSuppliesPresenter: MedicalSuppliesInteractorOutput {
    
    func sendErrorInfo(_ errorInfo: String?) {
        view?.showErrorInfo(title: "Ошибка", description: errorInfo)
    }
    
    func sendPageCopy(_ page: Page?) {
        self.page = page
        showMedicalSupplies(self.page?.items)
    }
    
    private func showMedicalSupplies(_ items: Array<MedicalSupply>?) {
        view?.showMedicalSupplies(items)
    }
    
}

