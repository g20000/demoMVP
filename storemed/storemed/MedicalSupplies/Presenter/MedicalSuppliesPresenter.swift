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
        let medicalSuppliesItems: [MedicalSupplyItem] = (items?.compactMap{ medicalSupply in
            let medicalSupplyItem = MedicalSupplyItem()
            medicalSupplyItem.percent = "-" + String(Int((Float(medicalSupply.price!) / Float(medicalSupply.rawPrice!) * 100))) + "%"
            medicalSupplyItem.image = medicalSupply.image
            medicalSupplyItem.title = medicalSupply.title
            medicalSupplyItem.substance = medicalSupply.substance
            medicalSupplyItem.producer = medicalSupply.producer
            medicalSupplyItem.rawPrice = String(medicalSupply.rawPrice!.description + " Р").strikeThrough()
            medicalSupplyItem.price = medicalSupply.price!.description + " Р"
            return medicalSupplyItem
            })!
        
        if medicalSuppliesItems.count > 0 {
            view?.showMedicalSupplies(medicalSuppliesItems)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
}

