//
//	SearchCodeItem.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCodeItem : Codable {
	public let gitUrl : String?
	public let htmlUrl : String?
	public let name : String?
	public let path : String?
	public let repository : SearchCodeRepository?
	public let score : Float?
	public let sha : String?
	public let url : String?
    
	enum CodingKeys: String, CodingKey {
		case gitUrl = "git_url"
		case htmlUrl = "html_url"
		case name = "name"
		case path = "path"
		case repository
		case score = "score"
		case sha = "sha"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		repository = try values.decodeIfPresent(SearchCodeRepository.self, forKey: .repository)
		score = try values.decodeIfPresent(Float.self, forKey: .score)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
