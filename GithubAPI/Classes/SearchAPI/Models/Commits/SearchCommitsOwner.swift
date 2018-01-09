//
//	SearchCommitsOwner.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCommitsOwner : Codable {
	public let avatarUrl : String?
	public let eventsUrl : String?
	public let followersUrl : String?
	public let followingUrl : String?
	public let gistsUrl : String?
	public let gravatarId : String?
	public let htmlUrl : String?
	public let id : Int?
	public let login : String?
	public let organizationsUrl : String?
	public let receivedEventsUrl : String?
	public let reposUrl : String?
	public let siteAdmin : Bool?
	public let starredUrl : String?
	public let subscriptionsUrl : String?
	public let type : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case eventsUrl = "events_url"
		case followersUrl = "followers_url"
		case followingUrl = "following_url"
		case gistsUrl = "gists_url"
		case gravatarId = "gravatar_id"
		case htmlUrl = "html_url"
		case id = "id"
		case login = "login"
		case organizationsUrl = "organizations_url"
		case receivedEventsUrl = "received_events_url"
		case reposUrl = "repos_url"
		case siteAdmin = "site_admin"
		case starredUrl = "starred_url"
		case subscriptionsUrl = "subscriptions_url"
		case type = "type"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
		followersUrl = try values.decodeIfPresent(String.self, forKey: .followersUrl)
		followingUrl = try values.decodeIfPresent(String.self, forKey: .followingUrl)
		gistsUrl = try values.decodeIfPresent(String.self, forKey: .gistsUrl)
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		organizationsUrl = try values.decodeIfPresent(String.self, forKey: .organizationsUrl)
		receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
		reposUrl = try values.decodeIfPresent(String.self, forKey: .reposUrl)
		siteAdmin = try values.decodeIfPresent(Bool.self, forKey: .siteAdmin)
		starredUrl = try values.decodeIfPresent(String.self, forKey: .starredUrl)
		subscriptionsUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionsUrl)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
