//
//  LoginViewController.swift
//  rush00
//
//  Created by teo KELESTURA on 2019/10/12.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class AlertHelper {
    func showAlert(fromController controller: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Invalid Login or Password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

class LoginViewController: UIViewController {

//    IMAGES
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
//    STACKVIEW
    @IBOutlet weak var stackView: UIStackView!
    
//    TEXT_FIELD
    @IBOutlet fileprivate var usernameTextField: UITextField!
    @IBOutlet fileprivate var passwdTextField: UITextField!
    
//    LOGIN_BUTTON
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonPress(_ sender: Any) {
//        https://CeckUserHere
        loadingIcon()
        if usernameTextField.text! != "" && passwdTextField.text! != "" {
            loadHomeScreen()
        }
        else {
            let alert = AlertHelper()
            alert.showAlert(fromController: self)

        }
    }
    
//    VIEW_DID_LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = ""
        passwdTextField.text = ""

//        if UIDevice.current.orientation.isLandscape {}
    }
    
    func loadingIcon () {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.color = UIColor.black
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func loadHomeScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
        self.present(loggedInViewController, animated: true, completion: nil)
    }
}
