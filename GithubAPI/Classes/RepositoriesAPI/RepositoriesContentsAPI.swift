//
//  RepositoriesContentsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/21/18.
//

import Foundation
import BaseAPI

/// These API endpoints let you create, modify, and delete Base64 encoded content in a repository. See media types for requesting the raw format or rendered HTML (when supported).
public class RepositoriesContentsAPI: GithubAPI {
    /// Gets the preferred README for a repository.
    ///
    /// - Parameters:
    ///   - owner: Repository owner.
    ///   - repo: Repository name.
    ///   - ref: The name of the commit/branch/tag. Default: the repository’s default branch (usually master)
    ///   - completion: Repository readme file content completion closure.
    public func getReadme(owner: String, repo: String, ref: String? = nil, completion: @escaping(RepositoryContentsReponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)/readme"
        var parameters: [String : String]?
        if let ref = ref {
            parameters = [String : String]()
            parameters!["ref"] = ref
        }
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    /// Gets the preferred README for a repository synchroniusly.
    ///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - ref: The name of the commit/branch/tag. Default: the repository’s default branch (usually master)
    /// - Returns: Repository readme file content response.
    public func getReadmeSync(owner: String, repo: String, ref: String? = nil) -> (response: RepositoryContentsReponse?, error: Error?) {
        let path = "/repos/\(owner)/\(repo)/readme"
        var parameters: [String : String]?
        if let ref = ref {
            parameters = [String : String]()
            parameters!["ref"] = ref
        }
        return self.getSync(path: path, parameters: parameters, headers: nil)
    }
	
	/// Gets the contents of a file in a repository. Specify the file path in :path.
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - path: File path in repository.
	///   - ref: The name of the commit/branch/tag. Default: the repository’s default branch (usually master).
	///   - completion: Repository file content completion closure.
	public func getFileContents(owner: String, repo: String, path: String, ref: String? = nil, completion: @escaping(RepositoryContentsReponse?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		var parameters: [String : String]?
		if let ref = ref {
			parameters = [String : String]()
			parameters!["ref"] = ref
		}
		self.get(path: path, parameters: parameters, completion: completion)
	}
	
	public func getDirectoryContents(owner: String, repo: String, path: String, ref: String? = nil, completion: @escaping([RepositoryContentsReponse]?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		var parameters: [String : String]?
		if let ref = ref {
			parameters = [String : String]()
			parameters!["ref"] = ref
		}
		self.get(path: path, parameters: parameters, completion: completion)
	}
}
