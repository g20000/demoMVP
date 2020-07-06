//
//  NewsItemWebViewInteractor.swift
//  storemed
//
//  Created by pragmus on 06.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import UIKit

class NewsItemWebViewInteractor {
    var webViewUrl: URL!
    var output: NewsItemWebViewInteractorOutput?
}

extension NewsItemWebViewInteractor: NewsItemWebViewInteractorInput {
    
    func requestUrl() {
        self.output?.sendUrlCopy(webViewUrl)
    }
    
}
