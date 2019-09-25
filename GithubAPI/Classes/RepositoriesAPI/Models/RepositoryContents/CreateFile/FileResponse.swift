//
//  FileResponse.swift
//  BaseAPI
//
//  Created by Serhii Londar on 2/21/19.
//

import Foundation

public class FileResponse: Codable {
	public let content: FileResponseContent?
	public let commit: FileResponseCommit?
	
	enum CodingKeys: String, CodingKey {
		case content = "content"
		case commit = "commit"
	}
	
	public init(content: FileResponseContent?, commit: FileResponseCommit?) {
		self.content = content
		self.commit = commit
	}
}

public class FileResponseCommit: Codable {
	public let sha: String?
	public let nodeID: String?
	public let url: String?
	public let htmlURL: String?
	public let author: FileResponseAuthor?
	public let committer: FileResponseAuthor?
	public let message: String?
	public let tree: FileResponseTree?
	public let parents: [FileResponseParent]?
	public let verification: FileResponseVerification?
	
	enum CodingKeys: String, CodingKey {
		case sha = "sha"
		case nodeID = "node_id"
		case url = "url"
		case htmlURL = "html_url"
		case author = "author"
		case committer = "committer"
		case message = "message"
		case tree = "tree"
		case parents = "parents"
		case verification = "verification"
	}
	
	public init(sha: String?, nodeID: String?, url: String?, htmlURL: String?, author: FileResponseAuthor?, committer: FileResponseAuthor?, message: String?, tree: FileResponseTree?, parents: [FileResponseParent]?, verification: FileResponseVerification?) {
		self.sha = sha
		self.nodeID = nodeID
		self.url = url
		self.htmlURL = htmlURL
		self.author = author
		self.committer = committer
		self.message = message
		self.tree = tree
		self.parents = parents
		self.verification = verification
	}
}

public class FileResponseAuthor: Codable {
	public let date: String?
	public let name: String?
	public let email: String?
	
	enum CodingKeys: String, CodingKey {
		case date = "date"
		case name = "name"
		case email = "email"
	}
	
	public init(date: String?, name: String?, email: String?) {
		self.date = date
		self.name = name
		self.email = email
	}
}

public class FileResponseParent: Codable {
	public let url: String?
	public let htmlURL: String?
	public let sha: String?
	
	enum CodingKeys: String, CodingKey {
		case url = "url"
		case htmlURL = "html_url"
		case sha = "sha"
	}
	
	public init(url: String?, htmlURL: String?, sha: String?) {
		self.url = url
		self.htmlURL = htmlURL
		self.sha = sha
	}
}

public class FileResponseTree: Codable {
	public let url: String?
	public let sha: String?
	
	enum CodingKeys: String, CodingKey {
		case url = "url"
		case sha = "sha"
	}
	
	public init(url: String?, sha: String?) {
		self.url = url
		self.sha = sha
	}
}

public class FileResponseVerification: Codable {
	public let verified: Bool?
	public let reason: String?
	public let signature: String?
	public let payload: String?
	
	enum CodingKeys: String, CodingKey {
		case verified = "verified"
		case reason = "reason"
		case signature = "signature"
		case payload = "payload"
	}
	
	public init(verified: Bool?, reason: String?, signature: String?, payload: String?) {
		self.verified = verified
		self.reason = reason
		self.signature = signature
		self.payload = payload
	}
}

public class FileResponseContent: Codable {
	public let name: String?
	public let path: String?
	public let sha: String?
	public let size: Int?
	public let url: String?
	public let htmlURL: String?
	public let gitURL: String?
	public let downloadURL: String?
	public let type: String?
	public let links: CeateFileResponseLinks?
	
	enum CodingKeys: String, CodingKey {
		case name = "name"
		case path = "path"
		case sha = "sha"
		case size = "size"
		case url = "url"
		case htmlURL = "html_url"
		case gitURL = "git_url"
		case downloadURL = "download_url"
		case type = "type"
		case links = "_links"
	}
	
	public init(name: String?, path: String?, sha: String?, size: Int?, url: String?, htmlURL: String?, gitURL: String?, downloadURL: String?, type: String?, links: CeateFileResponseLinks?) {
		self.name = name
		self.path = path
		self.sha = sha
		self.size = size
		self.url = url
		self.htmlURL = htmlURL
		self.gitURL = gitURL
		self.downloadURL = downloadURL
		self.type = type
		self.links = links
	}
}

public class CeateFileResponseLinks: Codable {
	public let linksSelf: String?
	public let git: String?
	public let html: String?
	
	enum CodingKeys: String, CodingKey {
		case linksSelf = "self"
		case git = "git"
		case html = "html"
	}
	
	public init(linksSelf: String?, git: String?, html: String?) {
		self.linksSelf = linksSelf
		self.git = git
		self.html = html
	}
}
