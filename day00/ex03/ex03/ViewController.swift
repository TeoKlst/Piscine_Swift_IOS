//
//  ViewController.swift
//  ex02
//
//  Created by teo KELESTURA on 2019/10/08.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayBtn: UILabel!
    
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var errorOperator = false
    var operation = 0
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            displayBtn.text = String(sender.tag-1)
            numberOnScreen = Double(displayBtn.text!)!
            performingMath = false
        }
        else {
            displayBtn.text = displayBtn.text! + String(sender.tag-1)
            numberOnScreen = Double(displayBtn.text!)!
        }

    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if displayBtn.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 17 {
            previousNumber = Double(displayBtn.text!)!
            
            if sender.tag == 13 {
                displayBtn.text = "/"
            } //divide
            else if sender.tag == 14 {
                displayBtn.text = "x"
            } //multiply
            else if sender.tag == 15 {
                displayBtn.text = "-"
            } //minus
            else if sender.tag == 16 {
                displayBtn.text = "+"
            } //plus
            performingMath = true
            operation = sender.tag
        }
        else if sender.tag == 17 {
            if operation == 13 {
                if numberOnScreen == 0 {
                    displayBtn.text = "0"
                }
                else {
                    displayBtn.text = String(previousNumber / numberOnScreen)
                }
            }
            else if operation == 14 {
                displayBtn.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 15 {
                displayBtn.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 16 {
                displayBtn.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            displayBtn.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
}

