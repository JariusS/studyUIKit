//
//  ViewController.swift
//  UipickerView
//
//  Created by Ярослав  on 26.06.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIPickerView()
    let datePicker = UIDatePicker()
    let timerPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //расположение элемента на эеране
        picker.center = view.center//указываем расположение элемента в центре экрана
        datePicker.center = view.center
        //datePicker.frame = CGRect.init(x: 100, y: 100, width: 200, height: 20)
        timerPicker.center = view.center
        
        //выбираем данные для редактирования/задания ограничения
        datePicker.datePickerMode = .date
        timerPicker.datePickerMode = .countDownTimer
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60 // переводим в секунды
        
        let todeyDate = Date()
        
        let oneYearFromToday = todeyDate.addingTimeInterval(oneYearTime)
        let twoYearFromToday = todeyDate.addingTimeInterval(oneYearTime * 5)
        datePicker.minimumDate = oneYearFromToday
        datePicker.maximumDate = twoYearFromToday
        
        timerPicker.countDownDuration = 2 * 60
        
        
        //подписываем наш класс на протоколы
        picker.dataSource = self
        picker.delegate = self
        
        //сообщаем view о наличии нового элемента
        //view.addSubview(picker)
        //view.addSubview(datePicker)
        view.addSubview(timerPicker)
        
        //устанавливаем наблюдателя
        datePicker.addTarget(self, action: #selector(datePickChange(paramdatePicker:)), for: .valueChanged)
    }
    @objc func datePickChange(paramdatePicker: UIDatePicker) {
        //if paramdatePicker,isEqual(self.datePicker) {//isEqual уже нет в UIDatePicker, для проверки надо придумать что-то другое
            print("dateChange: + ", paramdatePicker.date)
        //}
    }
}

extension ViewController: UIPickerViewDataSource {
    //метод который определяет количество выводимых элементов/компонентов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //метод указывает сколько строк у одного элемента
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
}
//заполняем наш элемент текстом
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
}
