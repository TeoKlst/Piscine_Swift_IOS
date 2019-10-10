//
//  AddViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/10.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    @IBAction func doneButton(_ sender: Any) {
        print (nameTextField.text!)
        print (descriptionTextView.text!)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: datePicker.date)
        let yourDate = formatter.date(from: myString)
        formatter.dateFormat = "dd-MMM-yyyy"
        let myStringafd = formatter.string(from: yourDate!)

        print (myStringafd)
        
        let newPage = DeathNotePage(name: nameTextField.text!, deathreason: descriptionTextView.text!, date: myStringafd)
        
        deathNotePages.append(newPage)
        
//        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @objc func isNameValid() {
        if nameTextField.text != "" {
            doneButtonOutlet.isEnabled = true
        }
        else {
            doneButtonOutlet.isEnabled = false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButtonOutlet.isEnabled = false
        let currentDate = Date()
        datePicker.minimumDate = currentDate
        nameTextField.addTarget(self, action: #selector(isNameValid), for:.editingChanged)
    }

}
