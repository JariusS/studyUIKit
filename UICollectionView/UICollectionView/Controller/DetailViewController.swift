//
//  DetailViewController.swift
//  UICollectionView
//
//  Created by Ярослав  on 09.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!{
        didSet {
            guard let image = menu?.imageName else {return}
            imageView.image = UIImage(named: image)
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = menu?.name
        }
    }
    
    var menu: Menu?

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

}
