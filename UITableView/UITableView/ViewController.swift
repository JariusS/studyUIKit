//
//  ViewController.swift
//  UITableView
//
//  Created by Ярослав  on 07.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var myTableView = UITableView()
    var indendifire = "Mycell"
    var array: [String]{
        var array = [String]()
        for i in 1...10 {
            array.append(String(i))
        }
        return array
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        
    }
    func createTable() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: indendifire)
        myTableView.delegate = self
        myTableView.dataSource = self
        //растягиваем таблицу на весь экран с помощью маски auto layuot
        myTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(myTableView)
    }
    
    //MARK: - UITableViewDataSource
    //определяет количество секций
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
    //определяет количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 3
//        case 1:
//            return 5
//        case 2:
//            return 8
//        default:
//            break
//        }
        return array.count
    }
    //создаем ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indendifire, for: indexPath)
        let number = array[indexPath.row]// чтоб уменьшить количество итераций/обращений к массиву
        cell.textLabel?.text = number
//        cell.textLabel?.text = "section = \(indexPath.section) cell = \(indexPath.row)"
//        switch indexPath.section {
//        case 0:
//            cell.backgroundColor = UIColor.red
//            cell.accessoryType = .checkmark
//        case 1:
//            cell.backgroundColor = UIColor.blue
//            cell.accessoryType = .detailDisclosureButton
//        case 2:
//            cell.backgroundColor = UIColor.orange
//            cell.accessoryType = .disclosureIndicator
//        default:
//            break
//        }
        return cell
    }
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
//    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        print("Accespry path = ", indexPath)
//
//        let ounerCell = tableView.cellForRow(at: indexPath)//ячйка по выбранному индексу
//        print("cell title = ", ounerCell?.textLabel?.text ?? "nil")
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = array[indexPath.row]
        print(indexPath.row, number)
    }


}

