//
//  ViewController.swift
//  UISegmentcontroll
//
//  Created by Ярослав  on 26.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var segmentControll = UISegmentedControl()
    var menuArray = ["one", "two", "three"]
    var imageArray = [UIImage]()
    
    
    
    
    var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewFrameWhidth = view.frame.width
        let viewHeight = view.frame.height
        //заполняем массив картинками
        for i in 0...4 {
            if let image = UIImage(named: "image\(i).jpg") {
                imageArray.append(image)
                
            }
        }
        
        //image
        imageView.frame = CGRect(x: 0, y: 0, width: viewFrameWhidth , height: viewFrameWhidth * 2)
        imageView.image = imageArray[0]
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        //create segment
        segmentControll = UISegmentedControl(items: menuArray)// делаем инициализацию
        segmentControll.frame = CGRect(x: Int((viewFrameWhidth - 300) / 2), y: Int(viewHeight - 40), width: 300, height: 30)
        segmentControll.backgroundColor = UIColor.black
        segmentControll.tintColor = UIColor.red
        view.addSubview(segmentControll)
        
        
        //add target
        segmentControll.addTarget(self, action: #selector(selectedValue), for: .valueChanged)
        
    }
    @objc func selectedValue(target: UISegmentedControl) {
        if target == segmentControll { //проверка на nil
            let segmentIndex = target.selectedSegmentIndex
            imageView.image = imageArray[segmentIndex]
            
            let pr = target.titleForSegment(at: segmentIndex)
            print(pr ?? "")
        }
        
    }


}

