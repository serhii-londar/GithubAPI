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
        self.gh_get(path: path, parameters: parameters, completion: completion)
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
        return self.gh_getSync(path: path, parameters: parameters, headers: nil)
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
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// The response will be an array of objects, one object for each item in the directory.
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - path: Directory path in repository.
	///   - ref: The name of the commit/branch/tag. Default: the repository’s default branch (usually master).
	///   - completion: Repository dictionary content completion closure.
	public func getDirectoryContents(owner: String, repo: String, path: String, ref: String? = nil, completion: @escaping([RepositoryContentsReponse]?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		var parameters: [String : String]?
		if let ref = ref {
			parameters = [String : String]()
			parameters!["ref"] = ref
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// Creates a new file in a repository.
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - path: File path in repository.
	///   - message: The commit message.
	///   - content: The new file content, using Base64 encoding.
	///   - branch: The branch name. Default: the repository’s default branch (usually master).
	///   - completion: Create file completion block.
	public func createFile(owner: String, repo: String, path: String, message: String, content: String, branch: String = "master", completion: @escaping(FileResponse?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		let request = FileRequest(message: message, branch: branch, sha: nil, committer: nil, content: content, author: nil)
		let data = try? JSONEncoder().encode(request)
		self.gh_put(path: path, body: data, completion: completion)
	}
	
	/// Updates a file in a repository.
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - path: File path in repository.
	///   - message: The commit message.
	///   - content: The new file content, using Base64 encoding.
	///   - sha: The blob SHA of the file being replaced.
	///   - branch: The branch name. Default: the repository’s default branch (usually master).
	///   - completion: Update file completion block.
	public func updateFile(owner: String, repo: String, path: String, message: String, content: String, sha: String, branch: String = "master", completion: @escaping(FileResponse?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		let request = FileRequest(message: message, branch: branch, sha: sha, committer: nil, content: content, author: nil)
		let data = try? JSONEncoder().encode(request)
		self.gh_put(path: path, body: data, completion: completion)
	}
	
	
	/// Deletes a file in a repository.
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - path: File path in repository.
	///   - message: The commit message.
	///   - sha: The blob SHA of the file being replaced.
	///   - branch: The branch name. Default: the repository’s default branch (usually master).
	///   - completion: Delete file completion block.
	public func deleteFile(owner: String, repo: String, path: String, message: String, sha: String, branch: String = "master", completion: @escaping(FileResponse?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/contents/\(path)"
		let request = FileRequest(message: message, branch: branch, sha: sha, committer: nil, content: nil, author: nil)
		let data = try? JSONEncoder().encode(request)
		self.gh_delete(path: path, body: data, completion: completion)
	}
}
