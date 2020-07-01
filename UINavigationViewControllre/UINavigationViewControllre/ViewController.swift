//
//  ViewController.swift
//  UINavigationViewControllre
//
//  Created by Ярослав  on 27.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displaySecondButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //создаем имя контороллера
        title = "FirstVC"
        
    
        
        displaySecondButton = UIButton(type: .system)
        displaySecondButton.setTitle("SecondVC", for: .normal)// задаем название кнопки в нормальном состоянии/ не нажата
        displaySecondButton.sizeToFit()//задаем размер кнопки подгоняя под размер экрана
        displaySecondButton.center = view.center
        view.addSubview(displaySecondButton)//добавляем кнопку на экран
        displaySecondButton.addTarget(self, action: #selector(perfonrDisplaySecondVC), for: .touchUpInside)
     
    }
    @objc func  perfonrDisplaySecondVC(parametrSender: Any) {
        let secondVC = SecondViewController()  //создаем экземпляр нового контроллера
        navigationController?.pushViewController(secondVC, animated: true) //при нажатии накнопку совершаем переход на secondVC
    }


}

