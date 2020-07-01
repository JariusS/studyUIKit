//
//  ViewController.swift
//  UIButton
//
//  Created by Ярослав  on 30.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let normalButtonImage = UIImage(named: "pause")
    let highlightedButtonImage = UIImage(named: "play-button")
    
    var myButton = UIButton()

    //@IBOutlet var myButtons: [UIButton]! // кнопки создавал в storyboarde
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .roundedRect)
        myButton.frame = CGRect(x: 110, y: 200, width: 100, height: 100)
        myButton.setTitleColor(.white, for: .normal)
        myButton.setTitleColor(.black, for: .highlighted)
        myButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)//размкр шрифта
        myButton.setBackgroundImage(normalButtonImage, for: .normal)//доболяем изображение
        myButton.setBackgroundImage(highlightedButtonImage, for: .highlighted)//доболяем изображение
        myButton.layer.cornerRadius = 50//закругление кнопки
        //myButton.titleLabel?.contentScaleFactor.
        myButton.setTitle("Кнопочка", for: .normal)//кнопка в обычном состоянии
        myButton.setTitle("I`m pressed", for: .highlighted)//кнопка в нажатом состоянии
        myButton.backgroundColor = .brown
        myButton.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        myButton.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)

        view.addSubview(myButton)
        
//        for button in myButtons {
//            button.setTitleColor(UIColor.red, for: .normal)
//            button.setTitleColor(UIColor.blue, for: UIControl.State)
//        }
       
    }
//    @IBAction func buttonAction(_ sender: Any) {
//        let button = sender as! UIButton
//        if button.titleLabel?.text == "Button1" {
//            print("Нажата кнопка 1")
//        } else if button.tag == 2 {
//            print("Нажата кнопка 2")
//        } else { print("Нажата кнопка 3")
//        }
//
//    }
    @objc func buttonIsPressed(sender: UIButton) {
        print("Button Is Pressed")
    }
    @objc func buttonIsTapped(sender: UIButton) {
        print("Button Is Tapped")
    }

}

