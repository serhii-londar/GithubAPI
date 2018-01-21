//
//	RepositoryLicense.swift
//
//	Create by Serhii Londar on 21/1/2018
//	Copyright © 2018 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct RepositoryLicense : Codable {
	public let htmlUrl : String?
	public let key : String?
	public let name : String?
	public let spdxId : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case htmlUrl = "html_url"
		case key = "key"
		case name = "name"
		case spdxId = "spdx_id"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		spdxId = try values.decodeIfPresent(String.self, forKey: .spdxId)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
