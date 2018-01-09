//
//	OtherUserResponse.swift
//
//	Create by Serhii Londar on 7/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct OtherUserResponse : Codable {
	public let avatarUrl : String?
	public let bio : String?
	public let blog : String?
	public let company : String?
	public let createdAt : String?
	public let email : String?
	public let eventsUrl : String?
	public let followers : Int?
	public let followersUrl : String?
	public let following : Int?
	public let followingUrl : String?
	public let gistsUrl : String?
	public let gravatarId : String?
	public let hireable : Bool?
	public let htmlUrl : String?
	public let id : Int?
	public let location : String?
	public let login : String?
	public let name : String?
	public let organizationsUrl : String?
	public let publicGists : Int?
	public let publicRepos : Int?
	public let receivedEventsUrl : String?
	public let reposUrl : String?
	public let siteAdmin : Bool?
	public let starredUrl : String?
	public let subscriptionsUrl : String?
	public let type : String?
	public let updatedAt : String?
	public let url : String?


	enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case bio = "bio"
		case blog = "blog"
		case company = "company"
		case createdAt = "created_at"
		case email = "email"
		case eventsUrl = "events_url"
		case followers = "followers"
		case followersUrl = "followers_url"
		case following = "following"
		case followingUrl = "following_url"
		case gistsUrl = "gists_url"
		case gravatarId = "gravatar_id"
		case hireable = "hireable"
		case htmlUrl = "html_url"
		case id = "id"
		case location = "location"
		case login = "login"
		case name = "name"
		case organizationsUrl = "organizations_url"
		case publicGists = "public_gists"
		case publicRepos = "public_repos"
		case receivedEventsUrl = "received_events_url"
		case reposUrl = "repos_url"
		case siteAdmin = "site_admin"
		case starredUrl = "starred_url"
		case subscriptionsUrl = "subscriptions_url"
		case type = "type"
		case updatedAt = "updated_at"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
		bio = try values.decodeIfPresent(String.self, forKey: .bio)
		blog = try values.decodeIfPresent(String.self, forKey: .blog)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
		followers = try values.decodeIfPresent(Int.self, forKey: .followers)
		followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl)
		following = try values.decodeIfPresent(Int.self, forKey: .following)
		followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl)
		gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl)
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
		hireable = try values.decodeIfPresent(Bool.self, forKey: .hireable)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl)
		publicGists = try values.decodeIfPresent(Int.self, forKey: .publicGists)
		publicRepos = try values.decodeIfPresent(Int.self, forKey: .publicRepos)
		receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
		reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl)
		siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin)
		starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl)
		subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
