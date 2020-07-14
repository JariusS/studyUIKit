//
//  MyTableViewController.swift
//  UITableViewController2
//
//  Created by Ярослав  on 09.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var itemArray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = Model(name: "Владимир Петров", prof: "Водитель")
        itemArray.append(item)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MyTableViewCell {
            let item = itemArray[indexPath.row]
            cell.refresh(item)
            return cell
        }
        
        return UITableViewCell()// если nil возвращаем пустую ячейку
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //задаем высоту ячейки
        return 100.0
    }
}
