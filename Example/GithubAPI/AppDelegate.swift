//
//  AppDelegate.swift
//  GithubAPI
//
//  Created by serhii-londar on 01/02/2018.
//  Copyright (c) 2018 serhii-londar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "RepositoryVC", bundle: nil)
        let repositoryVC = storyboard.instantiateViewController(withIdentifier: "RepositoryVC")
        let repositoryNC = UINavigationController(rootViewController: repositoryVC)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = repositoryNC
        self.window?.makeKeyAndVisible()
        
        return true
    }
}

