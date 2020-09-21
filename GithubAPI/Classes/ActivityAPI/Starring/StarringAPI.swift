//
//  StarringAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

#if swift(>=5.1) && os(Linux)
   import FoundationNetworking
#endif

/// Repository Starring is a feature that lets users bookmark repositories. Stars are shown next to repositories to show an approximate level of interest. Stars have no effect on notifications or the activity feed. For that, see Repository Watching.
public class StarringAPI: GithubAPI {
    /// List of users starred repository.
    ///
    /// - Parameters:
    ///   - owner: Repository owner.
    ///   - repo: Repository name.
    ///   - completion: Completion response closure with list users who starred current repository.
    public func listStargazers(owner: String, repo: String, completion: @escaping(ListStargazersResponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)/stargazers"
        self.gh_get(path: path, completion: completion)
    }
	
	/// List repositories being starred by a user.
	///
	/// - Parameters:
	///   - username: User name to get starred repositories for.
	///   - sort: One of created (when the repository was starred) or updated (when it was last pushed to). Default: created
	///   - direction: One of asc (ascending) or desc (descending). Default: desc
	///   - completion: Completion response closure with list of starred repositories.
	public func listRepositoriesBeingStarred(username: String, sort: String? = nil, direction: String? = nil, completion: @escaping(StarredRepositoriesResponse?, Error?) -> Void) {
		let path = "/users/\(username)/starred"
		self.gh_get(path: path, completion: completion)
	}
    
    /// Star a repository
    ///
    /// - Parameters:
    ///   - owner: Repository owner.
    ///   - repo: Repository name.
    ///   - completion: Completion response closure with request status.
    public func starRepository(owner: String, repo: String, completion: @escaping(Bool, Error?) -> Void) {
        let path = "/user/starred/\(owner)/\(repo)"
        self.gh_put(path: path, parameters: nil, headers: [:], body: nil) { (_, response, error) in
            guard error == nil else {
                completion(false, error)
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(false, nil)
                return
            }
            let success = statusCode == 204
            completion(success, nil)
        }
    }
    
    
    /// Untar a repository
    ///
    /// - Parameters:
    ///   - owner: Repository owner.
    ///   - repo: Repository name.
    ///   - completion: Completion response closure with request status.
    public func unstarRepository(owner: String, repo: String, completion: @escaping(Bool, Error?) -> Void) {
        let path = "/user/starred/\(owner)/\(repo)"
        self.delete(url: path, parameters: nil, headers: [:]) { (_, response, error) in
            guard error == nil else {
                completion(false, error)
                return
            }
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                completion(false, nil)
                return
            }
            let success = statusCode == 204
            completion(success, nil)
        }
    }
}
