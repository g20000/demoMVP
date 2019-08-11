//
//  CustomView.swift
//  BaseApp
//
//  21.02.18.
//

import UIKit

class CustomView: UIView {
    
    var shapeLayerShadow: CAShapeLayer?
    var borderLayer: CAShapeLayer?

    @IBInspectable var roundForTopCorners: Bool = false
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var cornerRadiusHalf: Bool = false
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            self.layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func prepareView() {
        if self.cornerRadiusHalf {
            self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        }
        if self.roundForTopCorners {
            self.roundTopCorners()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.prepareView()
    }
    
    private func roundTopCorners() {
        let corners:UIRectCorner = [.topLeft , .topRight]
        let maskPAth = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii:CGSize(width:16, height:16))
        let layer = CAShapeLayer()
        layer.frame = self.bounds
        layer.path = maskPAth.cgPath
        self.layer.mask = layer
    }
}

