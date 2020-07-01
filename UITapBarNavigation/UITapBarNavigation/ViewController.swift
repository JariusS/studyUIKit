//
//  ViewController.swift
//  UITapBarNavigation
//
//  Created by Ярослав  on 28.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "FirstVC"//имя присвоено навигейшену
        
        
        //title = "FirstVC" //имя присвоено контроллеру
        
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        self.tabBarItem = tabBarItem // tabBarItem (из абделегейта) контроллерк = этому
        
        
        view.backgroundColor = UIColor.green
    } 


}

