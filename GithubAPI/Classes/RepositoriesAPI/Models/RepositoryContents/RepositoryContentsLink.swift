//
//	RepositoryContentsLink.swift
//
//	Create by Serhii Londar on 21/1/2018
//	Copyright © 2018 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct RepositoryContentsLink : Codable {
	public let git : String?
	public let html : String?
	public let selfValue : String?

	enum CodingKeys: String, CodingKey {
		case git = "git"
		case html = "html"
		case selfValue = "self"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		git = try values.decodeIfPresent(String.self, forKey: CodingKeys.git)
		html = try values.decodeIfPresent(String.self, forKey: CodingKeys.html)
        selfValue = try values.decodeIfPresent(String.self, forKey: CodingKeys.selfValue)
	}
}
