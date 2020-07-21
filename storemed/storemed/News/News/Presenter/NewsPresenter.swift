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

class NewsPresenter: NSObject, Paginable {
    
    var view: NewsView?
    var router: NewsRouterDelegate?
    
    var dataCacher: DataCacher?
    private var articles: [Article]?
    
    internal var currentPageNumber = 0
    
    func updateView() {
        let requiredPageNumber = currentPageNumber + 1
        
        guard requiredPageNumber <= 5 else {
            self.view?.stopLoading()
            return
        }
        
        currentPageNumber = requiredPageNumber
        requestNews(currentPageNumber: currentPageNumber)
    }
    
    
    func requestNews(currentPageNumber: Int) {
        _ = NewsApi().loadNews(page: currentPageNumber, success: { [unowned self] articles in
            print(currentPageNumber)
            self.dataCacher?.refresh(items: articles!)
            self.sendNewsCopy(articles)
        }, failure: { [unowned self] error in
            self.sendErrorInfo(error.description)
        })
    }
}


//MARK: - router/navigation

extension NewsPresenter {
    
    func openUrl(url: URL?) {
        if let url = url {
            self.router?.openUrl(url)
        }
    }
    
}

extension NewsPresenter {
    
    func sendErrorInfo(_ errorInfo: String?) {
        view?.showErrorInfo(title: "Ошибка", description: errorInfo)
    }
    
    func sendNewsCopy(_ articles: [Article]?) {
        showNews(articles)
    }
    
    func sendCachedNews(_ cachedNews: [ArticleItem]?) {
        if let cachedNews = cachedNews, cachedNews.count > 0 {
            view?.showNews(cachedNews)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
    private func showNews(_ items: Array<Article>?) {
        let medicalSuppliesItems: [ArticleItem] = (items?.compactMap{ article in
                var articleItem = ArticleItem()
                articleItem.title = article.title
                articleItem.imageItem = article.urlToImage
                articleItem.descriptionItem = article.description
                articleItem.date = article.publishedAt
                articleItem.url = URL(string: article.url!)
                return articleItem
            })!
        
        if medicalSuppliesItems.count > 0 {
            view?.showNews(medicalSuppliesItems)
        } else {
            view?.showEmptyDataView(title: "Пусто")
        }
    }
    
}

