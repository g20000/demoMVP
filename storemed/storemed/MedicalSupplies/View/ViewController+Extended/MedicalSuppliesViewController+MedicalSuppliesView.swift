//
//  MedicalSuppliesViewController+MedicalSuppliesView.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

extension MedicalSuppliesViewController: MedicalSuppliesView {
    
    func showMedicalSupplies(_ medicalSupplies: Array<MedicalSupply>?) {
        items = medicalSupplies
        tableView.reloadData()
    }
    
}
