//
//  CarViewController.swift
//  PageViewController
//
//  Created by Ярослав  on 03.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    //MARK: - Image
    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false //убираем Auto Layout авто макет, будут констрейны
        return view
    }()//() - для инициализации
    
    //MARK: - Label
    private let nameLabel: UILabel = {
    let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subView: [UIView] = [self.carImage, self.nameLabel]
    
    //MARK: -Init      инициализация
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil)//вызываем родительский
        //затем свой
        view.backgroundColor = UIColor.purple
        edgesForExtendedLayout = []
        
        carImage.image = carWith.image
        nameLabel.text =  carWith.mame
        
        for view in subView {//добовляем на view
            view.addSubview(view)
        }
        //добавляем констрейны
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint.init(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint.init(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint.init(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
        NSLayoutConstraint.activate([
            NSLayoutConstraint.init(item: nameLabel, attribute: .top , relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint.init(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
