//
//	SearchCommitsItem.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCommitsItem : Codable {
	public let author : SearchCommitsAuthor?
	public let commentsUrl : String?
	public let commit : SearchCommitsCommit?
	public let committer : SearchCommitsCommitter?
	public let htmlUrl : String?
	public let parents : [SearchCommitsParent]?
	public let repository : SearchCommitsRepository?
	public let score : Float?
	public let sha : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case author
		case commentsUrl = "comments_url"
		case commit
		case committer
		case htmlUrl = "html_url"
		case parents = "parents"
		case repository
		case score = "score"
		case sha = "sha"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		author = try values.decodeIfPresent(SearchCommitsAuthor.self, forKey: .author)
		commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
		commit = try values.decodeIfPresent(SearchCommitsCommit.self, forKey: .commit)
		committer = try values.decodeIfPresent(SearchCommitsCommitter.self, forKey: .committer)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		parents = try values.decodeIfPresent([SearchCommitsParent].self, forKey: .parents)
		repository = try values.decodeIfPresent(SearchCommitsRepository.self, forKey: .repository)
		score = try values.decodeIfPresent(Float.self, forKey: .score)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
