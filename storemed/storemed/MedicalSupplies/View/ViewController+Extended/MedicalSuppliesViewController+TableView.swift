//
//  MedicalSuppliesViewController+TableView.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension MedicalSuppliesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (items != nil) ? items!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createTableViewCell(tableView, indexPath: indexPath)
    }
    
    func createTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return prepareMedicalSupplyTableViewCell(tableView, indexPath: indexPath)
    }
    
    func prepareMedicalSupplyTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MedicalSupplyTableViewCell
        let medicalSupply = medicalSupplyByIndexPath(indexPath)
        
        cell.labelTitle.text = medicalSupply?.title
        cell.imageViewMedicalSupply.sd_setImage(withStringUrl: medicalSupply?.image, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        cell.labelSubstance.text = medicalSupply?.substance
        cell.labelProducer.text = medicalSupply?.producer
        cell.labelRealPrice.text = medicalSupply?.rawPrice?.description
        cell.labelDiscountPrice.text = medicalSupply?.price?.description
        
        return cell
    }
    
    private func medicalSupplyByIndexPath(_ indexPath: IndexPath) -> MedicalSupply? {
        return medicalSupplyByIndex(indexPath.row)
    }
    
    private func medicalSupplyByIndex(_ index: Int) -> MedicalSupply? {
        if index < self.items!.count {
            return self.items?[index]
        }
        
        return nil
    }
    
}
