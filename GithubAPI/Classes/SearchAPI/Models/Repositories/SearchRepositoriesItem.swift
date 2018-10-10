//
//	SearchRepositoriesItem.swift
//
//	Create by Serhii Londar on 2/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchRepositoriesItem : Codable {
	public let createdAt : String?
	public let defaultBranch : String?
	public let descriptionField : String?
	public let fork : Bool?
	public let forksCount : Int?
	public let fullName : String?
	public let homepage : String?
	public let htmlUrl : String?
	public let id : Int?
	public let language : String?
	public let masterBranch : String?
	public let name : String?
	public let openIssuesCount : Int?
	public let owner : SearchRepositoriesOwner?
	public let privateField : Bool?
	public let pushedAt : String?
	public let score : Float?
	public let size : Int?
	public let stargazersCount : Int?
	public let updatedAt : String?
	public let url : String?
	public let watchersCount : Int?

	enum CodingKeys: String, CodingKey {
		case createdAt = "created_at"
		case defaultBranch = "default_branch"
		case descriptionField = "description"
		case fork = "fork"
		case forksCount = "forks_count"
		case fullName = "full_name"
		case homepage = "homepage"
		case htmlUrl = "html_url"
		case id = "id"
		case language = "language"
		case masterBranch = "master_branch"
		case name = "name"
		case openIssuesCount = "open_issues_count"
		case owner
		case privateField = "private"
		case pushedAt = "pushed_at"
		case score = "score"
		case size = "size"
		case stargazersCount = "stargazers_count"
		case updatedAt = "updated_at"
		case url = "url"
		case watchersCount = "watchers_count"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		defaultBranch = try values.decodeIfPresent(String.self, forKey: .defaultBranch)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
		forksCount = try values.decodeIfPresent(Int.self, forKey: .forksCount)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		homepage = try values.decodeIfPresent(String.self, forKey: .homepage)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		language = try values.decodeIfPresent(String.self, forKey: .language)
		masterBranch = try values.decodeIfPresent(String.self, forKey: .masterBranch)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		openIssuesCount = try values.decodeIfPresent(Int.self, forKey: .openIssuesCount)
		owner = try values.decodeIfPresent(SearchRepositoriesOwner.self, forKey: .owner)
		privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
		pushedAt = try values.decodeIfPresent(String.self, forKey: .pushedAt)
		score = try values.decodeIfPresent(Float.self, forKey: .score)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		stargazersCount = try values.decodeIfPresent(Int.self, forKey: .stargazersCount)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		watchersCount = try values.decodeIfPresent(Int.self, forKey: .watchersCount)
	}
}
