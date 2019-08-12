//
//  String+Extensions.swift
//  storemed
//
//  Created by pragmus on 12/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
}
