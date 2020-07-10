//
//  MedicalSuppliesViewController+HUD.swift
//  storemed
//
//  Created by pragmus on 11/08/2019.
//  Copyright © 2019 pragmus. All rights reserved.
//

import UIKit

extension NewsViewController {

    enum ViewTags: Int {
        case hud = 333
    }
    
    func showHUD(for view: UIView? = nil) -> Void {
        let superView: UIView! = view ?? self.view
        
        hideHUD(for: superView)
        let activityIndicator = createAndCustomizeActivityIndicator()
        let backgroundView = wrapIntoView(childView: activityIndicator)
        activityIndicator.startAnimating()
        installConstraints(for: backgroundView, and: activityIndicator, in: superView)
    }
    
    private func createAndCustomizeActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = UIColor.gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }
    
    private func wrapIntoView(childView: UIView) -> UIView {
        let backgroundView = UIView(frame: childView.frame)
        backgroundView.tag = ViewTags.hud.rawValue
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        self.view.addSubview(backgroundView)
        backgroundView.addSubview(childView)
        return backgroundView
    }
    
    private func installConstraints(for backgroundView: UIView, and activityIndicator: UIActivityIndicatorView, in superView: UIView) {
        let activityCenterY = activityIndicator.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        let activityCenterX = activityIndicator.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        
        let backgroundCenterY = backgroundView.centerYAnchor.constraint(equalTo: superView.centerYAnchor)
        let backgroundCenterX = backgroundView.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
        
        let backgroundLeft = backgroundView.leftAnchor.constraint(equalTo: activityIndicator.leftAnchor)
        let backgroundRight = backgroundView.rightAnchor.constraint(equalTo: activityIndicator.rightAnchor)
        let backgroundTop = backgroundView.topAnchor.constraint(equalTo: activityIndicator.topAnchor)
        let backgroundBottom = backgroundView.bottomAnchor.constraint(equalTo: activityIndicator.bottomAnchor)
        
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
