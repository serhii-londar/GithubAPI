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
        
//        SearchAPI().searchRepositories(q: "macos app", page: 1, per_page: 1) { (response, error) in
//            if let totalCount = response?.totalCount {
//                self.repoCount = totalCount
//            }
//            if self.repoCount > 0 {
//                self.search()
//            }
//        }
//        RepositoriesAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).listUserRepositories(user: "serhii-londar", type: .all) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        
//        UserAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).getUser { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        
//        UserAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).getUser(username: "serhii-londar") { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }
//        var user = UpdateUser()
//        user.name = "Serhii Londar"
//        user.hireable = false
//        UserAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).updateUser(user: user) { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        
//        UserAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).getAllUsers(since: "1") { (users, error) in
//            if let users = users {
//
//            } else {
//                print(error)
//            }
//        }
        
//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).getRepositoryIssues(owner: "serhii-londar", repository: "DocumenterXcode") { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).getIssue(owner: "serhii-londar", repository: "DocumenterXcode", number: 1) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        
        let issue = Issue(title: "Third Issue")
//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).createIssue(owner: "serhii-londar", repository: "GithubIssues", issue: issue) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }
        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "419e3bfd513a63eb38698e2c897441a536adbfc8")).updateIssue(owner: "serhii-londar", repository: "GithubIssues", number: 3, issue: issue) { (response, error) in
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

