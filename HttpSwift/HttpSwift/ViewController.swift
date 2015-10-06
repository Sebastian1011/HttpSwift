//
//  ViewController.swift
//  HttpSwift
//
//  Created by 张子名 on 10/3/15.
//  Copyright © 2015 tingdao. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var testButton: UIButton!
    
    let urlString:String = "http://www.tingdao.me:8390/auth/login"
    var token:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let manager = AFHTTPRequestOperationManager()
    }
    func requestUrl(urlString: String) {
        let manager = AFHTTPRequestOperationManager()
        let sets=NSSet()
        let type="text/html"
        manager.responseSerializer.acceptableContentTypes = sets.setByAddingObject(type)
        
        manager.GET(urlString,
            parameters: nil,
            success: {(operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
                self.token = responseObject.description
                print(self.token)
            },
            failure: {(operation: AFHTTPRequestOperation!, error: NSError!) in
                print(error)
        })
        
        //manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

        
        //let params = ["_token":token]
        
        /*manager.POST(urlString,
            parameters: params,
            success: { (operation: AFHTTPRequestOperation!,
                responseObject: AnyObject!) in
                
                let responseDict = responseObject as! NSDictionary!
                (responseDict)
                
            },
            failure: { (operation: AFHTTPRequestOperation!,
                error: NSError!) in
                print(error)
                //Handle Error
        })*/

    }
    
    @IBAction func printButton(sender: AnyObject) {
        requestUrl(urlString)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

