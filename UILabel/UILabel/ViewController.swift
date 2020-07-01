//
//  ViewController.swift
//  UILabel
//
//  Created by Ярослав  on 28.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let myLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let labelFrame = CGRect(x: 0, y: 0, width: 120, height: 50)
        myLabel.frame = labelFrame
        myLabel.text = "IOS 11 and Xcode 9. The Swift Dewelopers"
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)//шрифт
        myLabel.numberOfLines = 0 // написание текста по линиям 0 - автоматический по заполнению
        myLabel.lineBreakMode = .byWordWrapping // перенос по словам
        myLabel.adjustsFontSizeToFitWidth = true //подгон размера шрифта под label
        myLabel.center = view.center
        myLabel.backgroundColor = UIColor.orange
        myLabel.textColor = UIColor.green
        //тень
        myLabel.shadowColor = UIColor.white
        myLabel.shadowOffset = CGSize(width: 1, height: 1)
        
        myLabel.sizeToFit()
        myLabel.layer.cornerRadius = 25
        view.addSubview(myLabel)
        
        
    }


}

