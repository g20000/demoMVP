//
//  NewsItemWebViewPresenter.swift
//  storemed
//
//  Created by pragmus on 06.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import UIKit

class NewsItemWebViewPresenter {
    var view: NewsItemWebView?
    var interactor: NewsItemWebViewInteractorInput?
    
    func updateView() {
        interactor?.requestUrl()
    }
}

extension NewsItemWebViewPresenter: NewsItemWebViewInteractorOutput {
    
    func sendUrlCopy(_ url: URL) {
        view?.showWebByUrl(url)
    }
    
    func sendErrorInfo(_ errorInfo: String?) {
        
    }
    
}
