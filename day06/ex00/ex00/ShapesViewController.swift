//
//  ShapesViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/16.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ShapesViewController: UIViewController {

    @IBOutlet var viewUiView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ShapesViewController.didTap))
        self.view.addGestureRecognizer(tapGR)
        
//        let shapeView = Shape(origin: view.center)
//        self.view.addSubview(shapeView)
        
         print ("Running")
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer) {
        print("Tap test")
        
        let tapPoint = tapGR.location(in: self.view)
        
        let shapeView = ShapeView(origin: tapPoint)
        
        self.view.addSubview(shapeView)
    }
}

class ShapeView: UIView {
    
    let size: CGFloat = 100.0
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    
    init(origin: CGPoint) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.fillColor = randomColor()
        self.center = origin
        self.backgroundColor = UIColor.clear
        self.fillColor = randomColor()
        initGestureRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate))
        addGestureRecognizer(rotationGR)
    }
    
    
    override func draw(_ rect: CGRect) {
        let insetRect  = (rect).insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: 10)
        
        self.fillColor.setFill()
        path.fill()
        
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }
    
    @objc func didPan(panGR: UIPanGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        
        var translation = panGR.translation(in: self)
        
        translation = __CGPointApplyAffineTransform(translation, self.transform)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPoint.zero, in: self)
    }
    
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        
        let scale = pinchGR.scale
        
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        
        pinchGR.scale = 1.0
    }
    
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        
        let rotation = rotationGR.rotation
        
        self.transform = self.transform.rotated(by: rotation)
        
        rotationGR.rotation = 0.0
    }
    
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
    }
    
//    let size: CGFloat = 150.0
//    let lineWidth: CGFloat = 5
//
//    init(origin: CGPoint) {
//        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
//        self.center = origin
//        addGestures()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func draw(_ rect: CGRect) {
//        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
//        UIColor.red.setFill()
//        path.fill()
//        path.lineWidth = self.lineWidth
//        UIColor.black.setStroke()
//        path.stroke()
//    }
//
//    func addGestures() {
//        let panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        self.addGestureRecognizer(panGR)
//
//        let rotateGR = UIPanGestureRecognizer(target: self, action: #selector(handleRotate))
//        self.addGestureRecognizer(rotateGR)
//    }
//
//    @objc func handlePan(panGR: UIPanGestureRecognizer) {
//        self.superview!.bringSubviewToFront(self)
//        let translation = panGR.translation(in: self)
//        self.center.x += translation.x
//        self.center.y += translation.y
//        panGR.setTranslation(.zero, in: self)
//    }
//
//    @objc func handleRotate() {
//
//    }
}
