//
//	SearchRepositoriesOwner.swift
//
//	Create by Serhii Londar on 2/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchRepositoriesOwner : Codable {
	public let avatarUrl : String?
	public let gravatarId : String?
	public let id : Int?
	public let login : String?
	public let receivedEventsUrl : String?
	public let type : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case gravatarId = "gravatar_id"
		case id = "id"
		case login = "login"
		case receivedEventsUrl = "received_events_url"
		case type = "type"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		receivedEventsUrl = try values.decodeIfPresent(String.self, forKey: .receivedEventsUrl)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
