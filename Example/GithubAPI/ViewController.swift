//
//  ViewController.swift
//  GithubAPI
//
//  Created by serhii-londar on 01/02/2018.
//  Copyright (c) 2018 serhii-londar. All rights reserved.
//

import UIKit
import GithubAPI


class ViewController: UIViewController {
    var authentication: Credentials! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = try? Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "credentials", ofType: "json")!))
        
        self.authentication = try? JSONDecoder().decode(Credentials.self, from: data!)
            
        NotificationsAPI(authentication: TokenAuthentication(token: (self.authentication.token?.token)!)).notifications(all: true) { (response, error) in
            if let response = response {
                
            } else {
                print(error ?? "")
            }
        }
    }
}

