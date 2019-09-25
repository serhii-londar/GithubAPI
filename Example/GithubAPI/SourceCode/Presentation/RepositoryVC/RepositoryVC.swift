//
//  RepositoryVC.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 2/28/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import GithubAPI

class RepositoryVC: UIViewController {
    var token: String! = nil
    var repositoryOwner: String = "serhii-londar"
    var repositoryName: String = "GithubIssues"
    
    var loginVC: GithubLoginVC?
    var contentsAPI: RepositoriesContentsAPI!
    
    var files: [RepositoryContentsReponse] = []
    var path: String = ""
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if token == nil {
            self.login()
        } else {
            self.getContent()
        }
    }
    
    func login() {
        self.loginVC =  GithubLoginVC(clientID: "07433363de7de028229f", clientSecret: "add7ac2abdc6e81fa7ee19c824907a55f0877bb9", redirectURL: "https://github.com/serhii-londar/GithubIssues")
        self.loginVC?.login(withScopes: [Scopes.notifications], allowSignup: true, completion: { accessToken in
            self.token = accessToken
            self.getContent()
        }, error: { error in
            print(error.localizedDescription)
        })
    }
    
    func getContent() {
        let tokenAuthentication = TokenAuthentication(token: token)
        self.contentsAPI = RepositoriesContentsAPI(authentication: tokenAuthentication)
        self.contentsAPI.getDirectoryContents(owner: repositoryOwner, repo: repositoryName, path: path) { (response, error) in
            self.files = response ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    static func instantiateVC(with repositoryOwner: String, repositoryName: String) -> RepositoryVC {
        let storyboard = UIStoryboard(name: "RepositoryVC", bundle: nil)
        let repositoryVC = storyboard.instantiateViewController(withIdentifier: "RepositoryVC") as! RepositoryVC
        repositoryVC.repositoryOwner = repositoryOwner
        repositoryVC.repositoryName = repositoryName
        return repositoryVC
    }
    
    static func instantiateVC(with token: String, repositoryOwner: String, repositoryName: String) -> RepositoryVC {
        let storyboard = UIStoryboard(name: "RepositoryVC", bundle: nil)
        let repositoryVC = storyboard.instantiateViewController(withIdentifier: "RepositoryVC") as! RepositoryVC
        repositoryVC.token = token
        repositoryVC.repositoryOwner = repositoryOwner
        repositoryVC.repositoryName = repositoryName
        return repositoryVC
    }
}

extension RepositoryVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryFileCell") as! RepositoryFileCell
        let file = self.files[indexPath.row]
        cell.label.text = file.name
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let file = self.files[indexPath.row]
		guard let path = file.path else { return }
		
		if file.type == "file" {
			let storyboard = UIStoryboard(name: "RepositoryFileVC", bundle: nil)
			let repositoryFileVC = storyboard.instantiateViewController(withIdentifier: "RepositoryFileVC") as! RepositoryFileVC
			repositoryFileVC.path = path
            repositoryFileVC.token = token
			self.navigationController?.pushViewController(repositoryFileVC, animated: true)
		} else if file.type == "dir" {
			let storyboard = UIStoryboard(name: "RepositoryVC", bundle: nil)
			let repositoryVC = storyboard.instantiateViewController(withIdentifier: "RepositoryVC") as! RepositoryVC
			repositoryVC.path = path
            repositoryVC.token = token
			self.navigationController?.pushViewController(repositoryVC, animated: true)
		}
	}
}

extension RepositoryVC: RepositoryFileCellDelegate {
    func deleteButtonPressed(_ cell: RepositoryFileCell) {
        self.contentsAPI.deleteFile(owner: repositoryOwner, repo: repositoryName, path: "", message: "Remove file", sha: "") { (resposne, error) in
            
        }
    }
}
