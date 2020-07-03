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
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticleItemData")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do
        {
            try context.execute(deleteRequest)
            try context.save()
        }
        catch
        {
            print("There was an error")
        }
    }
    
    func makeRecord(_ articles: [ArticleItem]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let _: [ArticleItemData] = (articles.compactMap{ article in
            let articleItemData = ArticleItemData()
            articleItemData.title = article.title
            articleItemData.imageItem = article.imageItem
            articleItemData.descriptionItem = article.description
            articleItemData.date = Date()
            return articleItemData
        })
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    func refresh(with: [Article]) {
        guard isAvailableRecords else { return }
        
        deleteAllRecords()
        makeRecord([ArticleItem]())
    }
    
}
