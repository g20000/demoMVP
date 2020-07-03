//
//  Protocols.swift
//  storemed
//
//  Created by pragmus on 07/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import CoreData


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
    var managedContext: NSManagedObjectContext? { get set }
    
    func loadRecords() -> [ArticleItemData]?
    func deleteAllRecords()
    func makeRecord(_ articles: [ArticleItem])
    func refresh(with: [Article])
    
}

protocol Paginable {
    var currentPageNumber: Int { get set }
}
