//
//  ViewController.swift
//  UITextField
//
//  Created by Ярослав  on 29.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var myTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextField()
        myTextField.delegate = self// подписываемся на делегат
        
        myTextField.becomeFirstResponder()//появление клавиатуры при загрузке приложения
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil
        , queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil
        , queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
        
    }
    //MARK: - CreatedUI
    func createTextField() {
        let textFieldFrame = CGRect(x: 0, y: 0, width: 200, height: 31)
        myTextField = UITextField(frame: textFieldFrame)
        myTextField.borderStyle = UITextField.BorderStyle.roundedRect//задаем стиль контура
        myTextField.clearButtonMode = UITextField.ViewMode.always//крестик для удаления текста
        myTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center//выравнивание текста по вертикали
        myTextField.textAlignment = .center//выравнивание текста по горизонтали
        myTextField.placeholder = "I swift developer"
        myTextField.center = view.center
        view.addSubview(myTextField)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {// return NO to  disallow editing.
        print("textFieldShouldBeginEditing это я решаю можно ли редактирвать полe")
        return true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {// became first responder
        print("textFieldDidBeginEditing внимание началось редактирование")
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("textFieldShouldEndEditing внимание законьчелось редактирование")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {// if implemented, called in place of textFieldDidEndEditing:
        print("textFieldDidEndEditing")
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {// return NO to not change text
        print("shouldChangeCharactersIn = вы ввели = \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {// called when clear button pressed. return NO to ignore (no notifications)
        print("textFieldShouldClear = ты что то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {// called when 'return' key pressed. return NO to ignore.
        print("textFieldShouldReturn = хотите убрать клавиатуру")
        if textField == myTextField {
            myTextField.resignFirstResponder()
        }
        return true
    }
    
}




