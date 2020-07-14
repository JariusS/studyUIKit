//
//  MenuCollectionViewCell.swift
//  UICollectionViewTest
//
//  Created by Ярослав  on 10.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var menu: Menu? {
        didSet {
            nameLabel.text = menu?.name
            if let image = menu?.imageName {
                imageView.image = UIImage(named: image)
            }
        }
    }
}
