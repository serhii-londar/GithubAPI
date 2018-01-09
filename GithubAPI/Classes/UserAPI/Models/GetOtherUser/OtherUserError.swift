//
//	UserError.swift
//
//	Create by Serhii Londar on 7/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct OtherUserError : Error, Codable {
	public let documentationUrl : String?
	public let message : String?

	enum CodingKeys: String, CodingKey {
		case documentationUrl = "documentation_url"
		case message = "message"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		documentationUrl = try values.decodeIfPresent(String.self, forKey: .documentationUrl)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}
}
