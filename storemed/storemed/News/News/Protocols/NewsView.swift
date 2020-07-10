//
//  MedicalSuppliesView.swift
//  storemed
//
//  Created by pragmus on 03/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

protocol NewsView: AnyObject {
    
    func showNews(_ items: Array<ArticleItem>?)
    func stopLoading()
    func showErrorInfo(title: String?, description: String?)
    func showEmptyDataView(title: String?)
    
}
