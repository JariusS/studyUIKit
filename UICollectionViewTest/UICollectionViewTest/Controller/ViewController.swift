//
//  ViewController.swift
//  UICollectionViewTest
//
//  Created by Ярослав  on 10.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var itemMenuArray: [Menu] = {
        
        var blancMenu1 = Menu()
        blancMenu1.name = "Coca-Cola"
        blancMenu1.imageName = "cola"
        
        var blancMenu2 = Menu()
        blancMenu2.name = "Tea"
        blancMenu2.imageName = "icons8-чай-96"
        
        var blancMenu3 = Menu()
        blancMenu3.name = "Beer"
        blancMenu3.imageName = "icons8-пиво-96"
        
        var blancMenu4 = Menu()
        blancMenu4.name = "Coffe"
        blancMenu4.imageName = "icons8-кафе-96"
        
        var blancMenu5 = Menu()
        blancMenu5.name = "Milc"
        blancMenu5.imageName = "icons8-бутылка-молока-96"
        
        var blancMenu6 = Menu()
        blancMenu6.name = "Water"
        blancMenu6.imageName = "icons8-бутылка-воды-96"
        
        var blancMenu7 = Menu()
        blancMenu7.name = "Juce"
        blancMenu7.imageName = "icons8-апельсиновый-сок-96"
        
        return [blancMenu1, blancMenu2, blancMenu3, blancMenu4, blancMenu5, blancMenu6, blancMenu7]
    }()

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionCount = itemMenuArray.count
        return sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell {
            itemCell.menu = itemMenuArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
}
