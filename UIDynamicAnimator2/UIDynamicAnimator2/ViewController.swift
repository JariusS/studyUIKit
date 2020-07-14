//
//  ViewController.swift
//  UIDynamicAnimator2
//
//  Created by Ярослав  on 06.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var squareView = UIView()
    var animator = UIDynamicAnimator()
    var pushBehavior = UIPushBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        createGestureRecognizer()
        createSmallSquareView()
        createdAnimationAndBehaviors()
    }
    //created square
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        view.addSubview(squareView)
    }
    //create gesture/жест
    func createGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hendleTap(paramTap: )))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    //create crash/столкновение и толчок/ push
    func createdAnimationAndBehaviors(){
        animator = UIDynamicAnimator(referenceView: view)
        //create столкновение/collision
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        pushBehavior = UIPushBehavior(items: [squareView], mode: .continuous)
        animator.addBehavior(collision)
        animator.addBehavior(pushBehavior)
    }
    
    @objc func hendleTap(paramTap: UITapGestureRecognizer) {
        //получаем угол view
        let tapPoint: CGPoint = paramTap.location(in: view)
        let squareViewCenterPoint: CGPoint = squareView.center
        //определение угла касания/ толчка между двумя точками
        //arc tangent 2((p1.x - p2.x), (p1.y - p2.y))
        let deltaX: CGFloat = tapPoint.x - squareViewCenterPoint.x
        let deltaY: CGFloat = tapPoint.y - squareViewCenterPoint.y
        let angle: CGFloat = atan2(deltaY, deltaX)
        pushBehavior.angle = angle
        //находим силу толчка и ускорения
        let distanceBetweenPints: CGFloat = sqrt(pow(tapPoint.x - squareViewCenterPoint.x, 2.0) + pow(tapPoint.y - squareViewCenterPoint.y, 2.0))
        pushBehavior.magnitude = distanceBetweenPints / 200
        
    }
    
    


}

