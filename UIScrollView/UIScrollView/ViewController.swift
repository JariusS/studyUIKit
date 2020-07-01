//
//  ViewController.swift
//  UIScrollView
//
//  Created by Ярослав  on 30.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var myScrollView = UIScrollView()
    var myImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createdScrollView()
    }
    //MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {//реагирует на любые изменения
        print("Начинается прокрутка")
        print(scrollView.contentOffset.y)// получаем координату по y
        myScrollView.alpha = 0.50//прозрачность
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {//после прокрутки
        print("Вызывается после прокрутки")
        myScrollView.alpha = 1.0
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {//вызывается после пертаскивания
        print("Гарантирует, что вернёт альфу к 1")
        myScrollView.alpha = 1.0
    }
    
    
    
    
    func createdScrollView() {
        myScrollView.indicatorStyle = .white
        let imageToLoad = UIImage(named: "image0")
        myImageView = UIImageView(image: imageToLoad)
        myScrollView = UIScrollView(frame: view.bounds)//распологаем на весь экран
        myScrollView.addSubview(myImageView)
        myScrollView.contentSize = myImageView.bounds.size//задаем размер контента который будет находится на myScrollView/ будет полностью по размеру самой фотографии
        myScrollView.delegate = self// подписываемся на делегат
        view.addSubview(myScrollView)
    }
    
}

