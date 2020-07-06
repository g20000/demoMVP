//
//  NewsItemWebView.swift
//  storemed
//
//  Created by pragmus on 06.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import Foundation

protocol NewsItemWebView: AnyObject {
    
    func showWebByUrl(_ url: URL)
    func showErrorInfo(title: String?, description: String?)
    func showEmptyDataView(title: String?)
    
}
