//
//  MedicalSuppliesView.swift
//  storemed
//
//  Created by pragmus on 03/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

protocol MedicalSuppliesView: AnyObject {
    
    func showMedicalSupplies(_ medicalSupplies: Array<ArticleItem>?)
    func showErrorInfo(title: String?, description: String?)
    func showEmptyDataView(title: String?)
    
}
