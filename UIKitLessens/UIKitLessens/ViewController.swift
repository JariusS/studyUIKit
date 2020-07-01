//
//  ViewController.swift
//  UIKitLessens
//
//  Created by Ярослав  on 25.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hiLabel: UILabel!
    
    override func loadView() {
        super.loadView()
        
    }
    
    
    
    @IBAction func battonAction(_ sender: UIButton) {
        
        self.alert(title: "Внимание!", messege: "Введите ваше имя", style: .alert)
        self.hiLabel.text = "Hi,"
        //v1
        //        let alertController = UIAlertController(title: "Error!", message: "Ahtung!", preferredStyle: .alert)//добавляем алерт
        //        let action = UIAlertAction(title: "Ok", style: .default) { (action) in //добавляем кнопку
        //            let text = alertController.textFields?.first?.text
        //            print(text ?? "nil text ")
        
    }
    
    //alertController.addTextField(configurationHandler: nil)
    //        alertController.addAction(action)//сообщаем алерту о кнопке
    //        self.present(alertController, animated: true, completion: nil)// вызываем ViewController и сообщаем ему об алерте
    //v2
    func alert(title: String, messege: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: messege, preferredStyle: style)//добавляем алерт
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in //добавляем кнопку
            let text = alertController.textFields?.first
            if let addText = text?.text {
                self.hiLabel.text! += addText + "!"
            }
            
        }
        alertController.addTextField { (textField) in // добавляем в текстовое поле разные настройки
            textField.isSecureTextEntry = true
            
            
        }
        
        alertController.addAction(action)//сообщаем алерту о кнопке
        self.present(alertController, animated: true, completion: nil)// вызываем ViewController и сообщаем ему об алерте
    }
}

