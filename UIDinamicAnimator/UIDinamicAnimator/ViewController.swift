//
//  ViewController.swift
//  UIDinamicAnimator
//
//  Created by Ярослав  on 06.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //UICollisionBehavior - обнаружение столкновений
    //UIGravityBehavior - обеспечивает тяготение
    //UIPuchBehavior -  реагирует на толчки
    //UISnapBehavior - крепит view к определенной точке
    
    //let squareView = UIView() //рисуем обычное view
    var squareViews = [UIDynamicItem]()
    var animator = UIDynamicAnimator()//заменяем  corGrafics превращает view в динамические элементы

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func segueButton(_ sender: UIButton) {
        performSegue(withIdentifier: "secondView", sender: sender)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
//        //создаем квадрат
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = UIColor.green
//        squareView.center = view.center
//        view.addSubview(squareView)
//        //создаеме аниматор и тяготение
//        animator = UIDynamicAnimator(referenceView: view)
//        let gravity = UIGravityBehavior(items: [squareView])
//        animator.addBehavior(gravity)
        //создаем View
        let numberOfView = 2
        squareViews.reserveCapacity(numberOfView)
        var colors = [UIColor.red, UIColor.green]
        var currentCentrPoint: CGPoint = view.center
        let eachViewSize = CGSize(width: 50, height: 50)
        
        for counter in 0..<numberOfView {
            let newView = UIView(frame: CGRect(x: 0, y: 0, width: eachViewSize.width, height: eachViewSize.height))
            newView.center = currentCentrPoint
            newView.backgroundColor = colors[counter]
            currentCentrPoint.y += eachViewSize.height + 10
            view.addSubview(newView)
            squareViews.append(newView)
        }
        //создаеме аниматор
        animator = UIDynamicAnimator(referenceView: view)//действует в пределах view
        //создаеме тяготение
        let gravity = UIGravityBehavior(items: squareViews)
        animator.addBehavior(gravity)
        //реализуем столкновение
        let collision = UICollisionBehavior(items: squareViews)
        collision.translatesReferenceBoundsIntoBoundary = true // задаем ограничение границами экрана
        collision.addBoundary(withIdentifier: "bottomBoundary" as NSCopying,
                              from: CGPoint(x: 0, y: view.bounds.size.height - 100),
                              to: CGPoint(x: view.bounds.size.width, y: view.bounds.size.height - 100))//изменение границ действия объектов
        collision.collisionDelegate = self
        animator.addBehavior(collision)
        
    }
}

extension ViewController: UICollisionBehaviorDelegate {
    func collisionBehavior(_ behavior: UICollisionBehavior, beganContactFor item: UIDynamicItem, withBoundaryIdentifier identifier: NSCopying?, at p: CGPoint) {
        let indentifire = identifier as? String
        let kbottomBoundary = "bottomBoundary"
        if indentifire == kbottomBoundary {
            UIView.animate(withDuration: 1.0, animations: {
                let view = item as? UIView
                view?.backgroundColor = UIColor.red
                view?.alpha = 0.0
                view?.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }) { (finished) in
                let view = item as?  UIView
                behavior.removeItem(item)
                view?.removeFromSuperview()
            }
            
        }
        
    }
}
