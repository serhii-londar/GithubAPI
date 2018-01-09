//
//	SearchIssuesLabel.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchIssuesLabel : Codable {
	public let color : String?
	public let name : String?
	public let url : String?
    
	enum CodingKeys: String, CodingKey {
		case color = "color"
		case name = "name"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
