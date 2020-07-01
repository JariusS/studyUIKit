//
//  ViewController.swift
//  UIImageViewCod
//
//  Created by Ярослав  on 30.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var myImageView = UIImageView()
    let myImage = UIImage(named: "company")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //myImageView = UIImageView(frame: self.view.bounds) // вписываем в наш экран view
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        myImageView.image = myImage
        myImageView.center = view.center
        myImageView.layer.cornerRadius = 100
        myImageView.clipsToBounds = true
        myImageView.backgroundColor = .green
        myImageView.contentMode = .scaleAspectFill
        view.addSubview(myImageView)
    }


}

