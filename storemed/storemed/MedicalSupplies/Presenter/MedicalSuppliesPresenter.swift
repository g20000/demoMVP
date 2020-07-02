//
//  MedicalSuppliesPresenter.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSuppliesPresenter: NSObject, Paginable {
    
    var view: MedicalSuppliesView?
    var interactor: MedicalSuppliesInteractorInput?
    
    private var articles: [Article]?
    
    internal var currentPageNumber = 0
    
    func updateView() {
        let requiredPageNumber = currentPageNumber + 1
        
        guard requiredPageNumber <= 5 else {
            self.view?.stopLoading()
            return
        }
        
        currentPageNumber = requiredPageNumber
        
        interactor?.requestMedicalSupplies(currentPageNumber: currentPageNumber)
    }
    
}

extension MedicalSuppliesPresenter: MedicalSuppliesInteractorOutput {
        
    func sendErrorInfo(_ errorInfo: String?) {
        view?.showErrorInfo(title: "Ошибка", description: errorInfo)
    }
    
    func sendNewsCopy(_ articles: [Article]?) {
        showNews(articles)
    }
    
    private func showNews(_ items: Array<Article>?) {
        let medicalSuppliesItems: [ArticleItem] = (items?.compactMap{ article in
            let articleItem = ArticleItem()
            articleItem.title = article.title
            articleItem.imageItem = article.urlToImage
            articleItem.descriptionItem = article.description
            articleItem.date = article.publishedAt
            return articleItem
            })!
        
        if medicalSuppliesItems.count > 0 {
            view?.showMedicalSupplies(medicalSuppliesItems)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
}

