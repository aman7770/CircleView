//
//  CircleView.swift
//  CircleView
//
//  Created by Aman Sanghani on 28/09/18.
//  Copyright © 2018 Aman Firozali Sanghani. All rights reserved.
//

import UIKit


// CircleView
@IBDesignable class CircleView: UIView {
    // Ivars
    private var circularPath: UIBezierPath?
    
    private lazy var InnerLayer: CAShapeLayer? = {
        let layer = CAShapeLayer()
        layer.path = circularPath?.cgPath
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.position = CGPoint(x:self.layer.bounds.midX,  y: self.layer.bounds.midY)
        layer.lineCap = kCALineCapRound
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.black.cgColor
        self.layer.addSublayer(layer)
        return layer
    }()
    
    private lazy var OuterLayer: CAShapeLayer? = {
        let layer = CAShapeLayer()
        layer.path = circularPath?.cgPath
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        layer.position = CGPoint(x:self.layer.bounds.midX,  y: self.layer.bounds.midY)
        layer.lineCap = kCALineCapRound
        layer.fillColor = UIColor.white.cgColor
        layer.strokeColor = UIColor.black.cgColor
        layer.strokeEnd = 70 / 100
        self.layer.addSublayer(layer)
        return layer
    }()
    
    /// The Radius of the both circle.
    /// Default to 80.
    @IBInspectable var circleRadius: Double = 100 {
        didSet {
            setRadiusOfCircle()
        }
    }
    
    /// The thickness of the inner circle.
    /// Default to 2.0
    @IBInspectable var InnerLayerLineWidth: CGFloat = 2.0 {
        didSet {
            InnerLayer?.lineWidth = InnerLayerLineWidth
        }
    }
    
    /// The thickness of the outer circle.
    /// Default to 10.0
    @IBInspectable var OuterLayerLineWidth: CGFloat = 10.0{
        didSet {
            OuterLayer?.lineWidth = OuterLayerLineWidth
        }
    }
    
    /// The fill color for inner layer...
    /// default to white
    @IBInspectable var InnerLayerFillColor: UIColor? = UIColor.white {
        didSet {
            InnerLayer!.fillColor = InnerLayerFillColor?.cgColor
        }
    }
    
    /// The fill color for outer layer...
    /// default to white
    @IBInspectable var OuterLayerFillColor: UIColor? = UIColor.white {
        didSet {
            OuterLayer!.fillColor = OuterLayerFillColor?.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
          // Set intial radius...
          setRadiusOfCircle()
    }
    
    // Set radius...
    private func setRadiusOfCircle() {
        circularPath = UIBezierPath(arcCenter: .zero, radius: CGFloat(self.circleRadius), startAngle: 0, endAngle: .pi * 2.0, clockwise: true)
        InnerLayer?.path = circularPath?.cgPath
        OuterLayer?.path = circularPath?.cgPath
    }
    
}
