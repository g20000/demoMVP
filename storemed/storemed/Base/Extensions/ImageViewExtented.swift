//
//  ImageViewExtented.swift
//  Platform Mobile
//
//  Created by larens on 18/04/2019.
//  Copyright © 2019 Platform Mobile. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    public func sd_setImage(withStringUrl: String?, placeholderImage: UIImage?, completed: SDExternalCompletionBlock?) {
        guard let stringUrl = withStringUrl, let url = URL(string: stringUrl) else {
            self.image = placeholderImage
            return
        }
        
        self.sd_setImage(with: url, placeholderImage: placeholderImage, completed: completed)
    }
}
