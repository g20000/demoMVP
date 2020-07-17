//
//  MedicalSuppliesViewController.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit
import EasyDi
import SystemConfiguration

class NewsViewController: UIViewController, NetworkAbsentScrollable {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewEmptyData: UIView!
    @IBOutlet weak var labelEmptyDataInfo: UILabel!
    
    var presenter: NewsPresenter?
    
    private var searchController: UISearchController!
    
    internal var items = Array<ArticleItem>()
    var isNeedShowMessage = false
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateView()
    }
    
    private func configureViews() {
        showAlert()
    }
    
    private func updateView() {
        showHUD()
        presenter?.updateView()
    }
    
    private func openUrl(url: URL?) {
        guard let url = url else { return }
        presenter?.openUrl(url: url)//MOve url label
    }
    
}


//MARK: - tableView

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createTableViewCell(tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard !isInternetAvailable() else { return nil }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell absent network") as? AbsentNetworkTableViewCell
        cell?.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return isInternetAvailable() ? 0 : 60
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == items.count - 1 {
            updateView()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articleByIndexPath(indexPath)
        if let url = article?.url {
            openUrl(url: url)
        }
    }
    
    private func createTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        return prepareMedicalSupplyTableViewCell(tableView, indexPath: indexPath)
    }
    
    private func prepareMedicalSupplyTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NewsItemTableViewCell
        let article = articleByIndexPath(indexPath)
        
        cell.labelTitle.text = article?.title
        cell.imageViewNewsItem.sd_setImage(withStringUrl: article?.imageItem, placeholderImage: UIImage(named: "placeholder"), completed: nil)
        cell.labelDescription.text = article?.descriptionItem
        cell.labelDate.text = article?.date
        
        return cell
    }
    
    func prepareAbsentNetworkTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell absent network")
        return cell
    }
    
    private func articleByIndexPath(_ indexPath: IndexPath) -> ArticleItem? {
        return articleByIndex(indexPath.row)
    }
    
    private func articleByIndex(_ index: Int) -> ArticleItem? {
        if index < self.items.count {
            return self.items[index]
        }
        
        return nil
    }
    
}


extension NewsViewController: AbsentNetworkTableViewCellDelegate {
    
    func retryAction() {
        self.tableView?.beginUpdates()
        self.tableView?.endUpdates()
    }
    
}


//MARK: - presenter response

extension NewsViewController: NewsView {
    
    func showNews(_ medicalSupplies: Array<ArticleItem>?) {
        hideHUD()
        //hideEmptyDataViewFromScreen()
        self.items.append(contentsOf: medicalSupplies!)
        tableView.reloadData()
    }
    
    func stopLoading() {
        hideHUD()
    }
    
    func showErrorInfo(title: String?, description: String?) {
        hideHUD()
        //hideEmptyDataViewFromScreen()
        showErrorViewController(title: title!, description: description)
    }
    
    func showEmptyDataView(title: String?) {
        //showEmptyDataViewOnScreen(title: title)
    }
    
//    private func showEmptyDataViewOnScreen(title: String?) {
//        hideHUD()
//        viewEmptyData.isHidden = false
//        view.bringSubviewToFront(viewEmptyData)
//    }
//
//    private func hideEmptyDataViewFromScreen() {
//        viewEmptyData.isHidden = true
//        view.sendSubviewToBack(viewEmptyData)
//    }
    
}


//MARK: - is network abailable
//TODO: move to manager
extension NewsViewController {

    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }

        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }

    func showAlert() {
        if !isInternetAvailable() {
            let alert = UIAlertController(title: "Warning", message: "The Internet is not available", preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }

}

