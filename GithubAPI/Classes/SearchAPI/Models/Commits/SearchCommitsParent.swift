//
//	SearchCommitsParent.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCommitsParent : Codable {
	public let htmlUrl : String?
	public let sha : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case htmlUrl = "html_url"
		case sha = "sha"
		case url = "url"
	}

    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
