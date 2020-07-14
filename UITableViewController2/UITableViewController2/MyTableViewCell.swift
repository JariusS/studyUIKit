//
//  MyTableViewCell.swift
//  UITableViewController2
//
//  Created by Ярослав  on 09.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    public func refresh(_ item: Model) {
        nameLabel.text = item.name
        detailLabel.text = item.prof
    }

}
