//
//	NotificationsResponse.swift
//
//	Create by Serhii Londar on 9/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct NotificationsResponse : Codable {
	public let id : String?
	public let lastReadAt : String?
	public let reason : String?
	public let repository : NotificationsRepository?
	public let subject : NotificationsSubject?
	public let subscriptionUrl : String?
	public let unread : Bool?
	public let updatedAt : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case id = "id"
		case lastReadAt = "last_read_at"
		case reason = "reason"
		case repository
		case subject
		case subscriptionUrl = "subscription_url"
		case unread = "unread"
		case updatedAt = "updated_at"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		lastReadAt = try values.decodeIfPresent(String.self, forKey: .lastReadAt)
		reason = try values.decodeIfPresent(String.self, forKey: .reason)
		repository = try values.decodeIfPresent(NotificationsRepository.self, forKey: .repository)
		subject = try values.decodeIfPresent(NotificationsSubject.self, forKey: .subject)
		subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
		unread = try values.decodeIfPresent(Bool.self, forKey: .unread)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
