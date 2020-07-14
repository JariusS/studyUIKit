//
//  ViewController.swift
//  SFSafari View Controller
//
//  Created by Ярослав  on 03.07.2020.
//  Copyright © 2020 Ярослав . All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let url = URL(string: "https://www.google.com")  else { return }
        let safariViewController = SFSafariViewController(url: url)
        self.present(safariViewController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

