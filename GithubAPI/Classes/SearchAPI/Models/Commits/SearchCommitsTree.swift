//
//	SearchCommitsTree.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCommitsTree : Codable {
	public let sha : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case sha = "sha"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
