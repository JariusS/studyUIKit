//
//  MyTableViewController.swift
//  UITableViewController Static Table
//
//  Created by Ярослав  on 09.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var isPushSwitch: UISwitch!
    @IBOutlet weak var polSegment: UISegmentedControl!
    
    let userDefaults = UserDefaults.standard //singleton сохраняет данные на диск
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //загрузка сохраненных данных
        if let name  = userDefaults.object(forKey: "name") as? String {
            nameTextField.text = name
        }
        if let lastName = userDefaults.object(forKey: "lastName") as? String {
            lastNameTextField.text = lastName
        }
        if let mySswtch = userDefaults.object(forKey: "switch") as? Bool {
            isPushSwitch.isOn = mySswtch
        }
        if let sex = userDefaults.object(forKey: "segment") as? Int {
            polSegment.selectedSegmentIndex = sex
        }

    }

    @IBAction func saveButton(_ sender: UIButton) {
        userDefaults.setValue(nameTextField.text, forKey: "name")
        userDefaults.setValue(lastNameTextField.text, forKey: "lastName")
        userDefaults.set(isPushSwitch.isOn, forKey: "switch")
        userDefaults.set(polSegment.selectedSegmentIndex, forKey: "segment")
        print("save")
        lastNameTextField.resignFirstResponder() // прячем клавиатуру
        
}
}
