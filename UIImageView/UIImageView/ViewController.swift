//
//  ViewController.swift
//  UIImageView
//
//  Created by Ярослав  on 30.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        myImageView.layer.borderColor = UIColor.gray.cgColor
        myImageView.layer.borderWidth = 2
        myImageView.layer.cornerRadius = 50
        myImageView.backgroundColor = .green
        myImageView.contentMode = .scaleAspectFill
        myImageView.clipsToBounds = true
        
        
    }


}

