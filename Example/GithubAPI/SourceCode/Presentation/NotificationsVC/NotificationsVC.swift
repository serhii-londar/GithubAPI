//
//  NotificationsVC.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 1/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import GithubAPI

extension String {
    func fromBase64(options: Data.Base64DecodingOptions) -> String? {
        guard let data = Data(base64Encoded: self, options: options) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString()
    }
    
    func toBase64(options: Data.Base64EncodingOptions) -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: options)
    }
}

class NotificationsVC: UIViewController {
    var authentication: Credentials! = nil
    @IBOutlet weak var tableView: UITableView! = nil
    var notifications: [NotificationsResponse] = [NotificationsResponse]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		EventsAPI().listOfPublicEvents { (response, error) in
			
		}
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 40.0
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "credentials", ofType: "json")!))
        self.authentication = try? JSONDecoder().decode(Credentials.self, from: data!)
        
        let authentication = TokenAuthentication(token: (self.authentication.token?.token)!)
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
