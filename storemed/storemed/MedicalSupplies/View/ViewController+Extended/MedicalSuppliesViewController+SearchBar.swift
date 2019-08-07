//
//  MedicalSuppliesViewController+SearchBar.swift
//  storemed
//
//  Created by pragmus on 06/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension MedicalSuppliesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
