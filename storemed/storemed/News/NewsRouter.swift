//
//  Router.swift
//  storemed
//
//  Created by pragmus on 01/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class NewsRouter: NSObject {
    
    private var window: UIWindow?
    private var navigationController: UINavigationController?
    
    init(_ window: UIWindow?) {
        super.init()
        
        self.window = window
        self.navigationController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? UINavigationController
        createAppModules()
        window?.rootViewController = navigationController
    }
    
    private func createAppModules() {
        _ = createMedicalSuppliesList()
    }
    
    private func createMedicalSuppliesList() {
        let view = navigationController?.viewControllers.first as! NewsViewController
        let presenter = NewsPresenter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.dataCacher = DataCacher()
    }
    
    private func createNewsItemViewController(toOpen url: URL) -> NewsItemWebViewController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:"NewsItemWeb") as! NewsItemWebViewController
        let presenter = NewsItemWebViewPresenter()
        presenter.webViewUrl = url
        
        view.presenter = presenter
        presenter.view = view
        
        return view
    }
}

extension NewsRouter: NewsRouterDelegate {
    func openUrl(_ url: URL) {
        let newsItemViewController = createNewsItemViewController(toOpen: url)
        navigationController?.pushViewController(newsItemViewController, animated: true)
    }
}
