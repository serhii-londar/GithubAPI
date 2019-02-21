//
//  FileRequest.swift
//  BaseAPI
//
//  Created by Serhii Londar on 2/21/19.
//

import Foundation

/// Name	Type	Description
/// message	string	Required. The commit message.
/// content	string	Required. The new file content, using Base64 encoding.
/// branch	string	The branch name. Default: the repository’s default branch (usually master)
/// committer	object	The person that committed the file. Default: the authenticated user.
/// author	object	The author of the file. Default: The committer or the authenticated user if you omit committer.
/// sha	string	Required. The blob SHA of the file being replaced.
public class FileRequest: Codable {
	public let message: String?
	public let branch: String?
	public let sha: String?
	public let committer: FileRequestAuthor?
	public let content: String?
	public let author: FileRequestAuthor?
	
	enum CodingKeys: String, CodingKey {
		case message
		case branch
		case committer
		case content
		case author
		case sha
	}
	
	public init(message: String?, branch: String?, sha: String?, committer: FileRequestAuthor?, content: String?, author: FileRequestAuthor?) {
		self.message = message
		self.branch = branch
		self.committer = committer
		self.content = content
		self.author = author
		self.sha = sha
	}
}

/// Name	Type	Description
/// name	string	Required. The name of the author or committer of the commit. You'll receive a 422 status code if name is omitted.
/// email	string	Required. The email of the author or committer of the commit. You'll receive a 422 status code if name is omitted.
public class FileRequestAuthor: Codable {
	public let name: String?
	public let email: String?
	
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case email = "email"
	}
	
	public init(name: String?, email: String?) {
		self.name = name
		self.email = email
	}
}
