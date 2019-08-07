//
//  MedicalSupply.swift
//  storemed
//
//  Created by pragmus on 05/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

class MedicalSupply: NSObject, Codable, Copying {
    
    var id: Int?
    var title: String?
    var price: Float?
    var rawPrice: Float?
    var image: String?
    var producer: String?
    var substance: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case rawPrice = "raw_price"
        case image = "image"
        case producer = "producer_title"
        case substance = "substance_title"
    }
    
    required init(original: MedicalSupply) {
        id = original.id
        title = original.title
        price = original.price
        rawPrice = original.rawPrice
        image = original.image
        producer = original.producer
        substance = original.substance
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = MedicalSupply(original: self)
        return copy
    }
    
}
