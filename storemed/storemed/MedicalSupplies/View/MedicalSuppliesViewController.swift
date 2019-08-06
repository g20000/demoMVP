//
//  MedicalSuppliesViewController.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesViewController: UIViewController, MedicalSuppliesView, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter = MedicalSuppliesPresenter()
    private var query = ""
    
    private var searchController: UISearchController!
    
// MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        configureSearchViewController()
    }
    
    private func configureSearchViewController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.autocapitalizationType = .none
        
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        
        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
    }
    
}


// MARK: - UISearchBarDelegate

extension MedicalSuppliesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
