//
//  ViewController.swift
//  ex01
//
//  Created by teo KELESTURA on 2019/10/07.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickmeFunc(_ sender: Any) {
        oldLabel.text = "New Label"
        
    }
    
}

