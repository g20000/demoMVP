//
//  ArticleItemData+CoreDataProperties.swift
//  
//
//  Created by pragmus on 29.06.2020.
//
//

import Foundation
import CoreData


extension ArticleItemData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArticleItemData> {
        return NSFetchRequest<ArticleItemData>(entityName: "ArticleItemData")
    }

    @NSManaged public var date: Date?
    @NSManaged public var descriptionItem: String?
    @NSManaged public var imageItem: String?
    @NSManaged public var title: String?

}
