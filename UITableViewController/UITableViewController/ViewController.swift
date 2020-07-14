//
//  ViewController.swift
//  UITableViewController
//
//  Created by Ярослав  on 08.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableViewController = UITableViewController(style: .plain)
    let allItem = ["Jobs", "Tompson", "Lenon"]
    let identifire = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableViewController.tableView)
        createTableViewController()
    }
    func createTableViewController() {
        tableViewController.tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)
        tableViewController.tableView.delegate = self
        tableViewController.tableView.dataSource = self
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let item = allItem[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    
}
