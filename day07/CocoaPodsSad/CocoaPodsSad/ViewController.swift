//
//  ViewController.swift
//  CocoaPodsSad
//
//  Created by teo KELESTURA on 2019/10/17.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit
import RecastAI

let recastToken: String = "f1010c527e984915e11cb7e1af41aafa"

var chatBot: RecastAIClient?
var nbrRequest: Int? = nil

class ViewController: UIViewController {
    
    var chatBot: RecastAIClient?
    var nbrRequest: Int? = nil
    
    @IBOutlet weak var sendButton: UIButton!
    @IBAction func sendButtonPress(_ sender: Any) {
        if textField.text != "" {
            makeRequest(input: textField.text!)
        } else {
            labelLabel.text = "Bad input :("
        }
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var labelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        self.bot = RecastAIClient(token: recastToken, handlerRecastRequestProtocol: self)
        self.chatBot = RecastAIClient(token: recastToken, language: "en")
        if nbrRequest == nil {
            //            self.chatBot?.textRequest("Hello there!")
            print("Loaded")
            
            nbrRequest = 0
        }
    }
    
    func makeRequest(input: String) {
        self.chatBot?.textRequest(input, successHandler: recastRequestDone(_:), failureHandle: recastRequestFailed(_:))
    }

    func recastRequestDone(_ response : Response) {
        var toPrint: String = ""
        let message = response.get(entity: "message")
        print("Stuff \(response)")
        if (message != nil) {
            let formatted = message!["formatted"] as! String
            toPrint += "\(formatted)"
        }
        if toPrint == "" {
            toPrint = "No data available"
        }
        labelLabel.text = toPrint
    }
    
    func recastRequestFailed(_ error: Error) {
        labelLabel.text = "Failed \(error)"
        print("Failed \(error)")
    }
}
