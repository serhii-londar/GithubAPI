//
//	NotificationsSubject.swift
//
//	Create by Serhii Londar on 9/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct NotificationsSubject : Codable {
	public let latestCommentUrl : String?
	public let title : String?
	public let type : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case latestCommentUrl = "latest_comment_url"
		case title = "title"
		case type = "type"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		latestCommentUrl = try values.decodeIfPresent(String.self, forKey: .latestCommentUrl)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
