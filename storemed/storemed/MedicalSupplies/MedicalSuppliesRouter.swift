//
//  Router.swift
//  storemed
//
//  Created by pragmus on 01/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesRouter: NSObject {
    
    private var window: UIWindow?
    
    init(_ window: UIWindow?) {
        super.init()
        
        self.window = window
        createAppModules()
    }
    
    private func createAppModules() {
        createMedicalSuppliesList()
        createNewsItemViewController()
    }
    
    private func createMedicalSuppliesList() {
        let navigationController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as! UINavigationController
        
        let view = navigationController.viewControllers.first as! MedicalSuppliesViewController
        let presenter = MedicalSuppliesPresenter()
        let interactor = MedicalSuppliesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        interactor.dataCacher = DataCacher()
        
        window?.rootViewController = navigationController
    }
    
    private func createNewsItemViewController() {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:"NewsItemWeb")
        let presenter = MedicalSuppliesPresenter()
        let interactor = MedicalSuppliesInteractor()

        view.presenter = presenter
        presenter.view = view

        presenter.interactor = interactor
        interactor.output = presenter
    }
}
