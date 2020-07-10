//
//  MedicalSuppliesInteractorIO.swift
//  storemed
//
//  Created by pragmus on 03/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation

protocol NewsInteractorInput: AnyObject {
    func requestNews(currentPageNumber: Int)
}

protocol NewsInteractorOutput: AnyObject {
    func sendNewsCopy(_ articles: [Article]?)
    func sendErrorInfo(_ errorInfo: String?)
    func sendCachedNews(_ cachedNews: [ArticleItem]?)
}
