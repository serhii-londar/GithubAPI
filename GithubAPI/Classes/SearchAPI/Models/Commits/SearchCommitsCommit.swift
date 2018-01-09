//
//	SearchCommitsCommit.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCommitsCommit : Codable {
	public let author : SearchCommitsAuthor?
	public let commentCount : Int?
	public let committer : SearchCommitsCommitter?
	public let message : String?
	public let tree : SearchCommitsTree?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case author
		case commentCount = "comment_count"
		case committer
		case message = "message"
		case tree
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try values.decodeIfPresent(SearchCommitsAuthor.self, forKey: .author)
		commentCount = try values.decodeIfPresent(Int.self, forKey: .commentCount)
		committer = try values.decodeIfPresent(SearchCommitsCommitter.self, forKey: .committer)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		tree = try values.decodeIfPresent(SearchCommitsTree.self, forKey: .tree)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
