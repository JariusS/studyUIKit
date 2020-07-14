//
//  ViewController.swift
//  UICollectionView
//
//  Created by Ярослав  on 09.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var itemMenyArray: [Menu] = {
        var blancMeny = Menu()
        blancMeny.name = "Coca-Cola"
        blancMeny.imageName = "cola"
        
        var blancMeny2 = Menu()
        blancMeny2.name = "Tea"
        blancMeny2.imageName = "food (1)"
        
        var blancMenu3 = Menu()
        blancMenu3.name = "Water"
        blancMenu3.imageName = "water-bottle"
        
        return [blancMeny, blancMeny2, blancMenu3]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? DetailViewController {
                let menu = sender as? Menu
                print(menu ?? nil)
                vc.menu = menu
            }
        }
    }
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemMenyArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell{
            
            itemCell.menu = itemMenyArray[indexPath.row]
            return itemCell
        }
        return UICollectionViewCell()
    }
    //срабатывает при нажатии на ячейку
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let menu = itemMenyArray[indexPath.row] //получаем данные о нажатой ячейке
        self.performSegue(withIdentifier: "showVC", sender: menu)//совершаем переход по указанному сегвею "showVC"
        
    }
    
}
