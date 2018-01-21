//
//	RepositoryContentsReponse.swift
//
//	Create by Serhii Londar on 21/1/2018
//	Copyright © 2018 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct RepositoryContentsReponse : Codable {
	public let links : RepositoryContentsLink?
	public let content : String?
	public let downloadUrl : String?
	public let encoding : String?
	public let gitUrl : String?
	public let htmlUrl : String?
	public let name : String?
	public let path : String?
	public let sha : String?
	public let size : Int?
	public let type : String?
	public let url : String?


	enum CodingKeys: String, CodingKey {
		case links
		case content = "content"
		case downloadUrl = "download_url"
		case encoding = "encoding"
		case gitUrl = "git_url"
		case htmlUrl = "html_url"
		case name = "name"
		case path = "path"
		case sha = "sha"
		case size = "size"
		case type = "type"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		links = try values.decodeIfPresent(RepositoryContentsLink.self, forKey: .links)
		content = try values.decodeIfPresent(String.self, forKey: .content)
		downloadUrl = try values.decodeIfPresent(String.self, forKey: .downloadUrl)
		encoding = try values.decodeIfPresent(String.self, forKey: .encoding)
		gitUrl = try values.decodeIfPresent(String.self, forKey: .gitUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		sha = try values.decodeIfPresent(String.self, forKey: .sha)
		size = try values.decodeIfPresent(Int.self, forKey: .size)
		type = try values.decodeIfPresent(String.self, forKey: .type)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
