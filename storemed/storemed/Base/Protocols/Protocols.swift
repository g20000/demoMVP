//
//  Protocols.swift
//  storemed
//
//  Created by pragmus on 07/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

protocol Copying {
    
    init(original: Self)
    
}

protocol Responsable: Codable {
    
    var status: String? { get set }
    var code: Int? { get set }
    var message: String? { get set }
    
}
