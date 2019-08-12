//
//  MedicalSuppliesViewController+Alerts.swift
//  storemed
//
//  Created by pragmus on 12/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showErrorViewController(title: String, description: String?) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}
