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
    let token = (Credentials.shared.accessToken?.accessToken)!
    var repositoryOwner: String = "serhii-londar"
    var repositoryName: String = "GithubAPI"
    
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
        let tokenAuthentication = TokenAuthentication(token: token)
        self.contentsAPI = RepositoriesContentsAPI(authentication: tokenAuthentication)
        
        self.contentsAPI.getDirectoryContents(owner: repositoryOwner, repo: repositoryName, path: path) { (response, error) in
            self.files = response ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let file = self.files[indexPath.row]
		guard let path = file.path else { return }
		
		if file.type == "file" {
			let storyboard = UIStoryboard(name: "RepositoryFileVC", bundle: nil)
			let repositoryFileVC = storyboard.instantiateViewController(withIdentifier: "RepositoryFileVC") as! RepositoryFileVC
			repositoryFileVC.path = path
			self.navigationController?.pushViewController(repositoryFileVC, animated: true)
		} else if file.type == "dir" {
			let storyboard = UIStoryboard(name: "RepositoryVC", bundle: nil)
			let repositoryVC = storyboard.instantiateViewController(withIdentifier: "RepositoryVC") as! RepositoryVC
			repositoryVC.path = path
			self.navigationController?.pushViewController(repositoryVC, animated: true)
		}
	}
}
