//
//  ViewController.swift
//  UITableViewController+Refresh
//
//  Created by Ярослав  on 08.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let tableViewController = UITableViewController(style: .plain)
    var refresh = UIRefreshControl()
    var allTime = [Date]()
    let identifire = "MyCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        createTableViewController()
        refresh.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        refresh.tintColor = UIColor.purple
        tableViewController.tableView.addSubview(refresh)
    }
    @objc func handleRefresh(){
        allTime.append(Date())
        refresh.endRefreshing()
        let indexPathNewRow = IndexPath(row: allTime.count - 1, section: 0)//создаем IndexPath
        tableViewController.tableView.insertRows(at: [indexPathNewRow], with: .automatic)//указываем в какую ячейку вставить данные
        
    }
    func createTableViewController() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
        view.addSubview(tableViewController.tableView)
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let date = allTime[indexPath.row]
        cell.textLabel?.text = "\(date)"
        return cell
    }
    
    
}
