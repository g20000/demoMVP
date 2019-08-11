//
//  MedicalSuppliesViewController+HUD.swift
//  storemed
//
//  Created by pragmus on 11/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension MedicalSuppliesViewController {

    enum ViewTags: Int {
        case hud = 333
    }
    
    func showHUD(for view: UIView? = nil, background: Bool = false) -> Void {
        
        let superView: UIView! = view ?? self.view
        
        hideHUD(for: superView)
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = UIColor.gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundView = UIView(frame: activityIndicator.frame)
        backgroundView.tag = ViewTags.hud.rawValue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        backgroundView.layer.cornerRadius = background ? 4 : 0
        
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
        let activityCenterY = activityIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        let activityCenterX = activityIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        let backgroundCenterY = backgroundView.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        let backgroundCenterX = backgroundView.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
        
        let backgroundLeft = backgroundView.leftAnchor.constraint(equalTo: background ? superView.leftAnchor : activityIndicator.leftAnchor)
        let backgroundRight = backgroundView.rightAnchor.constraint(equalTo: background ? superView.rightAnchor : activityIndicator.rightAnchor)
        let backgroundTop = backgroundView.topAnchor.constraint(equalTo: background ? superView.topAnchor : activityIndicator.topAnchor)
        let backgroundBottom = backgroundView.bottomAnchor.constraint(equalTo: background ? superView.bottomAnchor : activityIndicator.bottomAnchor)
        
        NSLayoutConstraint.activate([
            activityCenterY,
            activityCenterX,
            backgroundCenterY,
            backgroundCenterX,
            backgroundLeft,
            backgroundRight,
            backgroundTop,
            backgroundBottom
            ])
        superView.layoutIfNeeded()
    }

    func hideHUD(for view: UIView? = nil) {
        
        self.view.subviews.filter( { $0.tag == ViewTags.hud.rawValue } )
            .forEach( { $0.removeFromSuperview() } )
    }

}
