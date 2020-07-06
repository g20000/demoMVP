//
//  NewsItemWebViewController.swift
//  storemed
//
//  Created by pragmus on 06.07.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import UIKit
import WebKit

class NewsItemWebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var presenter: NewsItemWebViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    private func configureViews() {
        //TODO:
        //showAlert()
    }
    
    private func updateView() {
        //TODO:
        //showHUD()
        presenter?.updateView()
    }

}

extension NewsItemWebViewController: NewsItemWebView {
    
    func showWebByUrl(_ url: URL) {
        let request = URLRequest(url: url)
        self.webView.load(request)
    }
    
    func showErrorInfo(title: String?, description: String?) {
        
    }
    
    func showEmptyDataView(title: String?) {
        
    }
    
}
