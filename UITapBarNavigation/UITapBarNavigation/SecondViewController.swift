//
//  SecondViewController.swift
//  UITapBarNavigation
//
//  Created by Ярослав  on 28.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "SecondVC"
        
        let tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        self.tabBarItem = tabBarItem
        //title = "SecondVC"
        view.backgroundColor = UIColor.orange
    }
    

}
