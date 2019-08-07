//
//  MedicalSuppliesPresenter+InteractorResponse.swift
//  storemed
//
//  Created by pragmus on 07/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

extension MedicalSuppliesPresenter: MedicalSuppliesInteractorOutput {
    
    func sendPageCopy(_ page: Page?) {
        showMedicalSupplies(page?.items)
    }
    
    func showMedicalSupplies(_ items: Array<MedicalSupply>?) {
        view?.showMedicalSupplies(items)
    }
    
}
