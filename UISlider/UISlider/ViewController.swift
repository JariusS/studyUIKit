//
//  ViewController.swift
//  UISlider
//
//  Created by Ярослав  on 26.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var sliderBoard: UISlider!
    @IBOutlet weak var volumLabel: UILabel!
    
    
    var player = AVAudioPlayer()
    var slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //slider
        slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        slider.center = view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        
        
        
        
        
        //addTarget
        //т.к. для слайдера мы не делали экшин прописываем target
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
        view.addSubview(slider)
        
        //указываем путь к аудиофайлу через проверку
        do {
            if let audioPath = Bundle.main.path(forResource: "(Группа крови) пожелай мне удачи в бою", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                slider.maximumValue = Float(player.duration)
            }
        } catch  {
            print("Error")
        }
        player.play()
        
    }
    //MARK: - Method
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            player.currentTime = TimeInterval(sender.value)
            view.backgroundColor? = UIColor.red //не доделал
            
        }
    }
    
    
    //MARK: - Action
    @IBAction func playButton(_ sender: UIButton) {
        player.play()
    }
    @IBAction func pauseButton(_ sender: UIButton) {
        player.pause()
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        player.volume = sliderBoard.value
        volumLabel.text = String(Int(player.volume * 100))
    }
    
    
}

