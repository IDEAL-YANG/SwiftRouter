//
//  ViewController.swift
//  SwiftRouterExample
//
//  Created by skyline on 15/9/24.
//  Copyright © 2015年 skyline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var routeButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.routeButton.addTarget(self, action: #selector(doRoute), for: UIControl.Event.touchDown)
        self.clearButton.addTarget(self, action: #selector(doClear), for: UIControl.Event.touchDown)
        // Do any additional setup after loading the view, typically from a nib.
        
        let router = Router.shared
        router.map("/user/:userId", controllerClass: UserViewController.self)
        router.map("/user/add") { (params:[String:String]?) -> (Bool) in
            if let params = params {
                print("\(String(describing: params["username"]))")
                print("\(String(describing: params["password"]))")
            }
            return true
        }
    }

    @objc func doRoute() {
        if let url = self.textField.text {
            try? Router.shared.routeURL(url, navigationController: self.navigationController!)
//            try? Router.shared.routeURL(url)
        }
    }

    @objc func doClear() {
        self.textField.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
