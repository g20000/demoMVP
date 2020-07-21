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
    var webViewUrl: URL!
    
    func updateView() {
        view?.showWebByUrl(webViewUrl)
    }
}

