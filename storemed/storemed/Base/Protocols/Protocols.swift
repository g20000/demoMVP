//
//  Protocols.swift
//  storemed
//
//  Created by pragmus on 07/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import CoreData
import UIKit


protocol Copying {
    
    init(original: Self)
    
}

protocol Responsable: Codable {
    
    var status: String? { get set }
    var code: Int? { get set }
    var message: String? { get set }
    
}

protocol Cachable {
    
    var isAvailableRecords: Bool { get set }
    var cacheLimit: Int { get set }
    
    func loadRecords() -> [ArticleItemData]?
    func deleteAllRecords()
    func makeRecord(_ articles: [ArticleItem])
    func refresh(items: [Article])
    
}

protocol Paginable {
    
    var currentPageNumber: Int { get set }
    
} 

/// It needs if you want to show uitableviewcell with info: Network is absent

protocol NetworkAbsentScrollable {
    
    /// flag property show/hide to perform loadAbsentNetworkTableViewCell()
    var isNeedShowMessage: Bool { get set }
    
    /// view render block
    func prepareAbsentNetworkTableViewCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell?
    
}
