//
//  NotificationsVC.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 1/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import GithubAPI

class NotificationsVC: UIViewController {
    var authentication: Credentials = Credentials.shared
    
    @IBOutlet weak var tableView: UITableView! = nil
    
    var notifications: [NotificationsResponse] = [NotificationsResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		EventsAPI().listOfPublicEvents { (response, error) in
			
		}
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 40.0
        
        guard let token = Credentials.shared.accessToken?.accessToken else { return }
        
        let authentication = TokenAuthentication(token: token)
        RepositoriesContentsAPI(authentication: authentication).getReadme(owner: "serhii-londar", repo: "open-source-mac-os-apps", ref: "new_apps") { (response, error) in
            if let response = response {
                if let contentString = response.content?.fromBase64(options: Data.Base64DecodingOptions(rawValue: 1)) {
                    
                    let contentStringBase64 = contentString.toBase64(options: Data.Base64EncodingOptions(rawValue: 1))
                    if contentStringBase64 == response.content {
                        print("equal")
                    }
                    
                }
            } else {
                print(error ?? "error")
            }
        }
        
        //        RepositoriesAPI(authentication: ).get(owner: "serhii-londar", repo: "open-source-mac-os-apps") { (response, error) in
        //            if let response = response {
        //
        //            } else {
        //                print(error)
        //            }
        //        }
        
        //        SearchAPI(authentication: TokenAuthentication(token: (self.authentication.token?.token)!)).searchRepositories(q: "macOS app language:Swift") { (response, error) in
        //            if let response = response {
        //
        //            } else {
        //                print(error)
        //            }
        //        }
        
        NotificationsAPI(authentication: TokenAuthentication(token: (self.authentication.token?.token)!)).notifications(all: true) { (response, error) in
            if let response = response {
                self.notifications = response
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print(error ?? "")
            }
        }
        
//        StarringAPI(authentication: authentication).listRepositoriesBeingStarred(username: "serhii-londar") { (response, error) in
//            print(error?.localizedDescription ?? "")
//            if let response = response {
//
//            }
//        }
//        StarringAPI(authentication: authentication).starRepository(owner: "serhii-londar", repo: "SteamLogin") { (response, error) in
//
//        }        
//        StarringAPI(authentication: authentication).unstarRepository(owner: "serhii-londar", repo: "SteamLogin") { (response, error) in
//
//        }
    }
}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsCell", for: indexPath) as! NotificationsCell
        let notification = self.notifications[indexPath.row]
        if let type = notification.subject?.type {
            if type == "PullRequest" {
                cell.notificationEventIcon.image = UIImage(named: "git-pull-request")
            } else if type == "Issue" {
                cell.notificationEventIcon.image = UIImage(named: "issue-opened")                
            } else {
                cell.notificationEventIcon.image = nil
            }
        }
        cell.notificationNameLabel.text = notification.subject?.title
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return -1
    }
}
