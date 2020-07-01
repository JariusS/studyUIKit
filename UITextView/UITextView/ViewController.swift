//
//  ViewController.swift
//  UITextView
//
//  Created by Ярослав  on 29.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mytextView = UITextView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextView), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        crateTextView()
        
        view.backgroundColor = .yellow
    }
    func crateTextView() {
        //mytextView = UITextView(frame: self.view.bounds)//на весь экран
        mytextView = UITextView(frame: CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: view.bounds.height / 2))
        mytextView.text = "Some text"
        mytextView.textColor = UIColor.red
        mytextView.backgroundColor = UIColor.lightGray
        mytextView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        mytextView.font = UIFont.systemFont(ofSize: 17)
        mytextView.textAlignment = NSTextAlignment.center
        view.addSubview(mytextView)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {//обработка жестов
        mytextView.resignFirstResponder()//при касании mytextView скрывается клавиатура
        mytextView.backgroundColor = .white//при касании меняется цвет
        
    }
    
    @objc  func updateTextView(param: Notification) {
        let userInfo = param.userInfo
        
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue //получаем координаты/размеры клавиатуры
        let keyboardFrame = view.convert(getKeyboardRect, to: view.window)//конвертируем
        
        if param.name == UIResponder.keyboardWillHideNotification {//если клавиатура скрылась
            mytextView.contentInset = UIEdgeInsets.zero//то возвращаем mytextView в нормальный вид
        } else {
            mytextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)// смещение по верху клавиатуры
            mytextView.scrollIndicatorInsets = mytextView.contentInset //прокрутка текста
            
        }
        mytextView.scrollRangeToVisible(mytextView.selectedRange)//прокрутка текста до видимой зоны
    }
    
}



