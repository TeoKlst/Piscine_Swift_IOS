//
//  AddViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/10.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBAction func doneButton(_ sender: Any) {
        print (nameTextField.text!)
        print (descriptionTextView.text!)
        print (datePicker.date)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDate = Date()
        datePicker.minimumDate = currentDate
    }

}
