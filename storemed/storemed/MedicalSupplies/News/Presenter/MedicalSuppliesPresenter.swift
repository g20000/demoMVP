//
//  MedicalSuppliesPresenter.swift
//  storemed
//
//  Created by pragmus on 02/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

protocol NewsRouterDelegate {
    func openUrl(_ url: URL)
}

class MedicalSuppliesPresenter: NSObject, Paginable {
    
    var view: MedicalSuppliesView?
    var interactor: MedicalSuppliesInteractorInput?
    var router: NewsRouterDelegate?
    
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
    
    func openUrl(url: URL?) {
        if let url = url {
            self.router?.openUrl(url)
        }
    }
    
}

extension MedicalSuppliesPresenter: MedicalSuppliesInteractorOutput {
    
    func sendErrorInfo(_ errorInfo: String?) {
        view?.showErrorInfo(title: "Ошибка", description: errorInfo)
    }
    
    func sendNewsCopy(_ articles: [Article]?) {
        showNews(articles)
    }
    
    func sendCachedNews(_ cachedNews: [ArticleItem]?) {
        if let cachedNews = cachedNews, cachedNews.count > 0 {
            view?.showMedicalSupplies(cachedNews)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
    private func showNews(_ items: Array<Article>?) {
        let medicalSuppliesItems: [ArticleItem] = (items?.compactMap{ article in
                let articleItem = ArticleItem()
                articleItem.title = article.title
                articleItem.imageItem = article.urlToImage
                articleItem.descriptionItem = article.description
                articleItem.date = article.publishedAt
                articleItem.url = URL(string: article.url!)
                return articleItem
            })!
        
        if medicalSuppliesItems.count > 0 {
            view?.showMedicalSupplies(medicalSuppliesItems)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
}

