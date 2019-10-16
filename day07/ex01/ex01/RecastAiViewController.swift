//
//  RecastAiViewController.swift
//  ex01
//
//  Created by teo KELESTURA on 2019/10/16.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class RecastAiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url : String = "http://google.com?test=toto&test2=titi"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"

//      f1010c527e984915e11cb7e1af41aafa
//      Fallback URL  https://api.cai.tools.sap/build/v1/dialog
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary

            if (jsonResult != nil) {
                // process jsonResult
            } else {
               // couldn't load JSON, look at error
            }
        })

    }
}
