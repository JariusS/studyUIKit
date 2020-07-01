//
//  ViewController.swift
//  UIBarButtonItem
//
//  Created by Ярослав  on 28.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        title = "View Controller"

        let item = ["up", "down"]
        let segmentController = UISegmentedControl(items: item) // добавляем наш массив
        segmentController.isMomentary = true //segmentController убираем отжатеи выбранной кнопки
        segmentController.addTarget(self, action: #selector(segmentControllerTaped(param:)), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: segmentController)
        
        
//3
//        let simpleSwitch = UISwitch()
//        simpleSwitch.isOn = true
//        simpleSwitch.addTarget(self, action: #selector(switchIsChange(param:)), for: .valueChanged)
//        //присваиваем наш свичь кнопке
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: simpleSwitch)

//2
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera,
//                                                            target: self,
//                                                            action: #selector(performAdd(param:)))

//1
        //createImageTitleView()
    }
    //MARK: - Method
//4
    @objc func segmentControllerTaped(param: UISegmentedControl) {
        switch param.selectedSegmentIndex {
        case  0 :
            print("up")
            title = "up"
            
        case  1 :
            print("down")
            title = "down"
        default:
            break
        }
    }
    
//3
//    @objc func switchIsChange(param: UISwitch) {
//        if param.isOn {
//            print("Switch is On!")
//        } else {
//            print("Switch is Off!")
//        }
//    }
    
    
//2
//    @objc func performAdd(param: UIBarButtonItem) {
//        print("Add click")
//    }
    
//1
//    fileprivate func createImageTitleView() {
//        //title = "First View Controller" //помещаем в navigationItem название
//        //помещаем в navigationItem изображение
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))  //создаем контейнер для фото
//        imageView.contentMode = .scaleAspectFit  //contentMode служить для правильного отображения изображения
//        let image = UIImage(named: "apple")
//        imageView.image = image //помещаем изображение в imageView
//        navigationItem.titleView = imageView
//    }
    
    
}

