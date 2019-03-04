//
//  RepositoryFileVC.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 3/1/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import GithubAPI

class RepositoryFileVC: UIViewController {
	var path: String! = nil
	var repositoryOwner: String = "serhii-londar"
	var repositoryName: String = "test1"
	let token = (Credentials.shared.accessToken?.accessToken)!
	var contentsAPI: RepositoriesContentsAPI!
	var sha: String? = nil
	
	@IBOutlet weak var textView: UITextView! {
		didSet {
			textView.text = ""
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let tokenAuthentication = TokenAuthentication(token: token)
		self.contentsAPI = RepositoriesContentsAPI(authentication: tokenAuthentication)
		self.contentsAPI.getFileContents(owner: repositoryOwner, repo: repositoryName, path: path) { (response, error) in
			DispatchQueue.main.async {
				self.textView.text = response?.content?.fromGithubBase64()
				self.sha = response?.sha
			}
		}
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(saveFile))
    }

	@objc func saveFile() {
		guard let content = self.textView.text.toGithubBase64() else { return }
		guard let sha = self.sha else { return }
		self.contentsAPI.updateFile(owner: repositoryOwner, repo: repositoryName, path: path, message: "test", content: content, sha: sha) { (response, error) in
			
		}
	}
}
