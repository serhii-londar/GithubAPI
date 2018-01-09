//
//	GetIssueResponsePullRequest.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct GetIssueResponsePullRequest : Codable {
	public let diffUrl : String?
	public let htmlUrl : String?
	public let patchUrl : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case diffUrl = "diff_url"
		case htmlUrl = "html_url"
		case patchUrl = "patch_url"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		diffUrl = try values.decodeIfPresent(String.self, forKey: .diffUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		patchUrl = try values.decodeIfPresent(String.self, forKey: .patchUrl)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
