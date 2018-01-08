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
    let readmeString = ""
    var pendingRepos = [String]()
    var repos = [SearchRepositoriesItem]()
    var repoCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        RepositoriesAPI(authentication: TokenAuthentication(token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).repositories
//        { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        
        NotificationsAPI(authentication: TokenAuthentication(token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).notifications(all: true) { (response, error) in
            if let response = response {
                
            } else {
                print(error ?? "")
            }
        }
    }

    func search() {
        if repos.count >= repoCount {
            print(pendingRepos)
            return
        }
        let per_page = 100
        let page = Int(repos.count / per_page) + 1
        SearchAPI().searchRepositories(q: "macos app", page: page, per_page: per_page) { (response, error) in
            if let response = response {
                guard let items = response.items else {
                    print("items is nil")
                    self.search()
                    return
                }
                self.repos.append(contentsOf: items)
                for item in items {
                    guard let htmlUrl = item.htmlUrl else {
                        print("htmlUrl is nil")
                        continue
                    }
                    if self.readmeString.contains(htmlUrl) {
                        continue
                    } else {
                        self.pendingRepos.append(htmlUrl)
                    }
                }
                Thread.sleep(forTimeInterval: 5)
                self.search()
            } else {
                print(error ?? "")
            }
        }
    }
}

