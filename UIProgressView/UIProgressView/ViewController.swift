//
//  ViewController.swift
//  UIProgressView
//
//  Created by Ярослав  on 03.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private var myProgressView = UIProgressView()
    private var myButton = UIButton()
    private var myTimer = Timer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //createdProgress(myProgressView)
        cratedButton(myButton, "загрузка", "старт")
        //createdTimer()
        
        
    }
    //MARK: - fix add delegate
    //MARK: - Timer
    private func createdTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.5,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    @objc func updateProgressView() {
        if myProgressView.progress != 1 {
            myProgressView.progress += 0.1
            self.myButton.alpha = 0.5
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1.0
                self.myButton.setTitle("Start", for: .normal)
                self.myTimer.invalidate()//завершение работы таймера
            }
        }
        
    }
    
    
    //MARK: - UI
    private func createdProgress(_ progressView: UIProgressView) {
        //задаем стиль
        progressView.progressViewStyle = .bar
        //размеры и расположение
        let widthOfProgress = 150
        progressView.frame = CGRect(x: (Int(view.center.x) - widthOfProgress / 2),
                                    y: (Int(view.center.y) + widthOfProgress),
                                    width: widthOfProgress,
                                    height: 50)
        progressView.trackTintColor = .black// цвет полосы фона
        progressView.progressTintColor = .orange// цвет полосы загрузки
        view.addSubview(progressView)
    }
    private func cratedButton(_ buttonView: UIButton,_ titleNormal: String?, _ titleHighlighted: String?) {
        buttonView.frame = CGRect(x: view.bounds.width / 4, y: view.center.y, width: 200, height: 100)
        buttonView.center = view.center
        buttonView.setTitleColor(.blue, for: .normal)
        buttonView.setTitleColor(.black, for: .normal)
        
        buttonView.backgroundColor = .yellow
        buttonView.setTitle(titleNormal, for: .normal)
        buttonView.setTitle(titleHighlighted, for: .highlighted)
        if buttonView.isEnabled == false {
            buttonView.alpha = 0.5
        }
        
        buttonView.addTarget(self, action: #selector(buttonIsPressed), for: .touchDown)
        buttonView.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        view.addSubview(buttonView)
        
    }
    @objc func buttonIsPressed() {
        print("on")
        createdProgress(myProgressView)
        createdTimer()
        
        
    }
    @objc func buttonIsTapped() {
        print("off")
    }
}

