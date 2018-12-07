//
//  StarringAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

/// Repository Starring is a feature that lets users bookmark repositories. Stars are shown next to repositories to show an approximate level of interest. Stars have no effect on notifications or the activity feed. For that, see Repository Watching.
public class StarringAPI: GithubAPI {
    /// List of users starred repository.
    ///
    /// - Parameters:
    ///   - owner: Repository owner.
    ///   - repo: Repository name.
    ///   - completion: Completion response closure with list users who starred current repository.
    public func listStargazers(owner: String, repo: String, completion: @escaping([ListStargazersResponse]?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)/stargazers"
        self.get(path: path, completion: completion)
    }
	
	/// List repositories being starred by a user.
	///
	/// - Parameters:
	///   - username: User name to get starred repositories for.
	///   - sort: One of created (when the repository was starred) or updated (when it was last pushed to). Default: created
	///   - direction: One of asc (ascending) or desc (descending). Default: desc
	///   - completion: Completion response closure with list of starred repositories.
	func listRepositoriesBeingStarred(username: String, sort: String?, direction: String?, completion: @escaping([ListStargazersResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/starred"
		self.get(path: path, completion: completion)
	}
}
