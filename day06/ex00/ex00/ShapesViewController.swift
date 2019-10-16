//
//  ShapesViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/16.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ShapesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shapeView = Shape(origin: view.center)

        self.view.addSubview(shapeView)
        print ("Running")
    }
}

class Shape: UIView {
    
    let size: CGFloat = 150.0
    let lineWidth: CGFloat = 5

    init(origin: CGPoint) {
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.center = origin
        addGestures()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        UIColor.red.setFill()
        path.fill()
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }
    
    func addGestures() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        self.addGestureRecognizer(panGR)
        
        let rotateGR = UIPanGestureRecognizer(target: self, action: #selector(handleRotate))
        self.addGestureRecognizer(rotateGR)
    }
    
    @objc func handlePan(panGR: UIPanGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        let translation = panGR.translation(in: self)
        self.center.x += translation.x
        self.center.y += translation.y
        panGR.setTranslation(.zero, in: self)
    }
    
    @objc func handleRotate() {
        
    }
}
