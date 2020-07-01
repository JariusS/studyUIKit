//
//  SecondViewController.swift
//  UINavigationViewControllre
//
//  Created by Ярослав  on 28.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "SecondVC"
        
    
    }
    override func viewDidAppear(_ animated: Bool) {//срабатывает при переходе на текущий экран с задержкой 3 сек.
        super.viewDidAppear(true)
        perform(#selector(goBack), with: nil, afterDelay: 3.0)
    }
    @objc func goBack() {
        //navigationController?.popViewController(animated: true)//срабатывает переход на предидущий экран
        //получаем текущий массив контроллеров
        var curentControllerArry = navigationController?.viewControllers
        
        //удаляем последний контроллер в массиве
        curentControllerArry?.removeLast()
        
        //обновляем данные
        guard let newController = curentControllerArry else { return }
            navigationController?.viewControllers = newController
    }

}
