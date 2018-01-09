//
//	GetIssueResponseLabel.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct GetIssueResponseLabel : Codable {
	public let color : String?
	public let defaultField : Bool?
	public let id : Int?
	public let name : String?
	public let url : String?
    
	enum CodingKeys: String, CodingKey {
		case color = "color"
		case defaultField = "default"
		case id = "id"
		case name = "name"
		case url = "url"
	}
	
    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		defaultField = try values.decodeIfPresent(Bool.self, forKey: .defaultField)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
