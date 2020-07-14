//
//  MyPageViewController.swift
//  PageViewController
//
//  Created by Ярослав  on 03.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    //MARK: - Viriable
    var cars = [CarsHelper]()
    
    let car0 = UIImage(named: "car0")
    let car1 = UIImage(named: "car1")
    let car2 = UIImage(named: "car2")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageCar0 = car0 {
            let firstCar = CarsHelper(mame: "firstCar", image: imageCar0)
            cars.append(firstCar)
        }
        if let imageCar1 = car1 {
            let secondCar = CarsHelper(mame: "secontCar", image: imageCar1)
            cars.append(secondCar)
        }
        if let imageCar2 = car2 {
            let thirdCar = CarsHelper(mame: "thirdCar", image: imageCar2)
            cars.append(thirdCar)
        }
    }
    //MARK: - create VC
    lazy var arrayCarViewController: [CarViewController] = {
        var carsVC = [CarViewController]()
        for car in cars {
            carsVC.append(CarViewController(carWith: car))
        }
        return carsVC
    }()
    //MARK: - Init MyPageViewController
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = UIColor.green
        
        self.delegate = self
        self.dataSource = self
        // контроллер отображаемый при запуске
        setViewControllers([arrayCarViewController[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension MyPageViewController: UIPageViewControllerDataSource,  UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil}
        if let index = arrayCarViewController.index(of: viewController) {
            if index > 0 {
                return arrayCarViewController[index - 1]
            }
        }
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? CarViewController else { return nil}
        if let index = arrayCarViewController.index(of: viewController) {
            if index < cars.count - 1 {
                return arrayCarViewController[index + 1]
            }
            
        }
        return nil
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {// Количество элементов, отраженных в индикаторе страницы.
        return cars.count
    }
    
        func presentationIndex(for pageViewController: UIPageViewController) -> Int {// Выбранный элемент отражен в индикаторе страницы.
        return 0
    }
}

