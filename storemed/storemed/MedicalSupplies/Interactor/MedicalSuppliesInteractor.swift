//
//  MedicalSuppliesInteractor.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesInteractor: NSObject {

    var output: MedicalSuppliesInteractorOutput?
    var dataCacher: DataCacher?
    
}

extension MedicalSuppliesInteractor: MedicalSuppliesInteractorInput {
    
    func requestMedicalSupplies(currentPageNumber: Int) {
        sendSavedArticles()
        _ = NewsApi().loadNews(page: currentPageNumber, success: { articles in
            print(currentPageNumber)
            self.dataCacher?.refresh(with: articles!)
            self.output?.sendNewsCopy(articles)
        }, failure: { error in
            self.output?.sendErrorInfo(error.description)
        })
    }
}


//MARK: db caching

extension MedicalSuppliesInteractor {
    
    func sendSavedArticles() {
        let savedArticlesData = dataCacher?.loadRecords()
        
        let savedArticles: [ArticleItem] = (savedArticlesData?.compactMap{ articleData in
            let article = ArticleItem()
            article.title = articleData.title
            article.imageItem = articleData.imageItem
            article.descriptionItem = articleData.description
            article.date = "Set data"
            return article
            })!
        self.output?.sendCachedNews(savedArticles)
    }
    
}
