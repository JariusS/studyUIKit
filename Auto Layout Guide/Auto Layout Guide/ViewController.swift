//
//  ViewController.swift
//  Auto Layout Guide
//
//  Created by Ярослав  on 07.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView = {
       let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var view2: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(view1)
        view.addSubview(view2)
        createView2Constraint()
        createView3Constraint()
        //createView1Constraint()// первый вариант
    }
    func createView2Constraint() {
        NSLayoutConstraint(item: view1, attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1, attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view1, attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
        NSLayoutConstraint(item: view1, attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 200).isActive = true
    }
    func createView3Constraint() {
        NSLayoutConstraint(item: view2,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: view1,
                           attribute: .top,
                           multiplier: 1,
                           constant: -8).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
        NSLayoutConstraint(item: view2,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: 100).isActive = true
    }


//    func createView1Constraint() {
//        NSLayoutConstraint(item: view1, attribute: .leading,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .leadingMargin,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1, attribute: .trailingMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .trailingMargin,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//        NSLayoutConstraint(item: view1, attribute: .top,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .topMargin,
//                           multiplier: 1,
//                           constant: 88).isActive = true
//        NSLayoutConstraint(item: view1, attribute: .height,
//                           relatedBy: .equal,
//                           toItem: view1,
//                           attribute: .width,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//    }


}

