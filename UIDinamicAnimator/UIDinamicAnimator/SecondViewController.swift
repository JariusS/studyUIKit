//
//  SecondViewController.swift
//  UIDinamicAnimator
//
//  Created by Ярослав  on 11.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSwitchOutlet: UISwitch!
    @IBOutlet weak var greenSwitchOutlet: UISwitch!
    @IBOutlet weak var blueSwitchOutlet: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = .black
        colorView.layer.borderColor = UIColor.red.cgColor

        
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
    }
    func updateColor() {
        
        
        if redSwitchOutlet.isOn {
            red = 1
        }
        if greenSwitchOutlet.isOn {
            green = 1
        }
        if blueSwitchOutlet.isOn {
            blue = 1
        }
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    @IBAction func redSliderChanged(_ sender: UISlider) {
        if redSwitchOutlet.isOn {
            red = CGFloat(redSlider.value)
        }
    }
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        if greenSwitchOutlet.isOn {
            green = CGFloat(greenSlider.value)
        }
    }
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        if blueSwitchOutlet.isOn {
            blue = CGFloat(blueSlider.value)
        }
    }
    
   
  

}
