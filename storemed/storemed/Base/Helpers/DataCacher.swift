//
//  DataCacher.swift
//  storemed
//
//  Created by pragmus on 29.06.2020.
//  Copyright © 2020 pragmus. All rights reserved.
//

import UIKit
import CoreData

class DataCacher: NSObject, Cachable {
    
    var isAvailableRecords: Bool = true
    var cacheLimit: Int = 5
    var managedContext: NSManagedObjectContext?
    
    func loadRecords() -> [ArticleItemData]? {
        let fetch: NSFetchRequest<ArticleItemData> = ArticleItemData.fetchRequest()
        fetch.predicate = NSPredicate()
        do {
            return try managedContext?.fetch(fetch)
        } catch let error as NSError {
            print("Ошибка выборки: \(error) описание: \(error.userInfo)")
            return nil
        }
    }
    
    func deleteAllRecords() {
        
    }
    
    func makeRecord() {
        
    }
    
    func refresh() {
        guard isAvailableRecords else { return }
        
        deleteAllRecords()
        makeRecord()
    }
    
}
