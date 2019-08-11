//
//  MedicalSuppliesViewController.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter = MedicalSuppliesPresenter()
    
    private var searchController: UISearchController!
    
    internal var items = Array<MedicalSupply>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        updateView()
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
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Я ищу"
        definesPresentationContext = true
    }
    
    private func updateView() {
        showHUD()
        presenter.updateView(searchController.searchBar.text!.trimmingCharacters(in: .whitespaces))
    }
    
}


//MARK: - tableView

extension MedicalSuppliesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createTableViewCell(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            updateView()
        }
    }
    
    private func createTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return prepareMedicalSupplyTableViewCell(tableView, indexPath: indexPath)
    }
    
    private func prepareMedicalSupplyTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MedicalSupplyTableViewCell
        let medicalSupply = medicalSupplyByIndexPath(indexPath)
        
        cell.labelTitle.text = medicalSupply?.title
        cell.imageViewMedicalSupply.sd_setImage(withStringUrl: medicalSupply?.image, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        cell.labelSubstance.text = medicalSupply?.substance
        cell.labelProducer.text = medicalSupply?.producer
        cell.labelRealPrice.text = medicalSupply?.rawPrice?.description
        cell.labelDiscountPrice.text = medicalSupply?.price?.description
        
        return cell
    }
    
    private func medicalSupplyByIndexPath(_ indexPath: IndexPath) -> MedicalSupply? {
        return medicalSupplyByIndex(indexPath.row)
    }
    
    private func medicalSupplyByIndex(_ index: Int) -> MedicalSupply? {
        if index < self.items.count {
            return self.items[index]
        }
        
        return nil
    }
    
}


//MARK: - presenter response

extension MedicalSuppliesViewController: MedicalSuppliesView {
    
    func showMedicalSupplies(_ medicalSupplies: Array<MedicalSupply>?) {
        hideHUD()
        self.items.append(contentsOf: medicalSupplies!)
        tableView.reloadData()
    }
    
}


//MARK: - searchBar

extension MedicalSuppliesViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        showHUD()
        updateView()
    }
    
}

