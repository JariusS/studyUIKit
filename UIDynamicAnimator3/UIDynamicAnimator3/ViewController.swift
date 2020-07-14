//
//  ViewController.swift
//  UIDynamicAnimator3
//
//  Created by Ярослав  on 07.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var snapBehavior: UISnapBehavior?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        createSquareView()
        createGestureRecognizer()
        createAnimatorAndBehaviors()
    }
     func createSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.purple
        squareView.center = view.center
        view.addSubview(squareView)
    }
    func createGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(paramTap:)))
        view.addGestureRecognizer(tap)
    }
    func createAnimatorAndBehaviors() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //зацеп
        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
        
    }
    @objc func handleTap(paramTap: UITapGestureRecognizer) {
        //получаем угол между центром квадрата view и точкой касания
        let tapPoint = paramTap.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tapPoint)
        snapBehavior?.damping = 0.5 // средняя осцилляция
        animator.addBehavior(snapBehavior!)
    }


}

