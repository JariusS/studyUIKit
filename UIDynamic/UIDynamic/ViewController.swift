//
//  ViewController.swift
//  UIDynamic
//
//  Created by Ярослав  on 07.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //UIAttachmentBehavior - привязка
    //UISnapBehavior - снимок
    
    var squareView = UIView()
    var squareViewAnnchorView = UIView()
    var anchorView = UIView()
    var animator = UIDynamicAnimator()
    var attachmentBehavior: UIAttachmentBehavior?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createGestureRecognizer()
        createSmallSquareView()
        createAnchorView()
        createAnimationAndBehavior()
    }
    func createSmallSquareView() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.backgroundColor = UIColor.green
        squareView.center = view.center
        squareViewAnnchorView = UIView(frame: CGRect(x: 60, y: 0, width: 20, height: 20))
        squareViewAnnchorView.backgroundColor = UIColor.brown
        squareView.addSubview(squareViewAnnchorView)
        view.addSubview(squareView)
    }
    //view с точкой привязки
    func createAnchorView() {
        anchorView = UIView(frame: CGRect(x: view.center.x + 65 , y: view.center.y - 65, width: 20, height: 20))
        anchorView.backgroundColor = UIColor.red
        view.addSubview(anchorView)
    }
    //создаем регистратор жестa паранормирования
    func createGestureRecognizer() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handletPan(paramPan:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    //столкновение и прикрепление
    func createAnimationAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        //столкновение
        let collision = UICollisionBehavior(items: [squareView])
        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachmentBehavior!)
    }
    //определяет где палец - туда красный квадрат, а потом к большому
    @objc func handletPan(paramPan: UIPanGestureRecognizer) {
        let tapPoint = paramPan.location(in: view)//передаем локацию пальца на view
        print(tapPoint)
        attachmentBehavior?.anchorPoint = tapPoint
        anchorView.center = tapPoint
        
    }


}

