//
//  Router.swift
//  storemed
//
//  Created by pragmus on 01/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesRouter: NSObject {
    
    var rootViewController = UIViewController()
    
    init(_ viewController: UIViewController?) {
        super.init()
        
        rootViewController = viewController!
        self.createAppModules()
    }
    
    private func createAppModules() {
        createMedicalSuppliesList()
    }
    
    private func createMedicalSuppliesList() {
        let view = MedicalSuppliesViewController()
        let presenter = MedicalSuppliesPresenter()
        let interactor = MedicalSuppliesInteractor()
        
        view.presenter = presenter
        presenter.view = view
        
        presenter.interactor = interactor
        interactor.output = presenter
        
        rootViewController = view
    }
    
}
