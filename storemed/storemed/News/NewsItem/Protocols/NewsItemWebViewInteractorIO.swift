//
//  NewsItemWebViewInteractorIO.swift
//  storemed
//
//  Created by pragmus on 06.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import Foundation

protocol NewsItemWebViewInteractorInput: AnyObject {
    
    func requestUrl()
    
}

protocol NewsItemWebViewInteractorOutput: AnyObject {
    func sendUrlCopy(_ url: URL)
    func sendErrorInfo(_ errorInfo: String?)
}
