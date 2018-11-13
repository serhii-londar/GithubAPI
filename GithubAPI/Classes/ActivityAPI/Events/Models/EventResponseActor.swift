//
//  EventActor.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 1, 2018

import Foundation

public struct EventResponseActor : Codable {
	public let avatarUrl : String?
	public let gravatarId : String?
	public let id : Int?
	public let login : String?
	public let url : String?
	
	enum CodingKeys: String, CodingKey {
		case avatarUrl = "avatar_url"
		case gravatarId = "gravatar_id"
		case id = "id"
		case login = "login"
		case url = "url"
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		avatarUrl = try values.decodeIfPresent(String.self, forKey: .avatarUrl)
		gravatarId = try values.decodeIfPresent(String.self, forKey: .gravatarId)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		login = try values.decodeIfPresent(String.self, forKey: .login)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}	
}