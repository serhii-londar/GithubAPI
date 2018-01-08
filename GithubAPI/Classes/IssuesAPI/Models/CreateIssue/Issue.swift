//
//	Issue.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct Issue : Codable {
	public let assignees : [String]?
	public let body : String?
	public let labels : [String]?
	public let milestone : Int?
	public let title : String?

	enum CodingKeys: String, CodingKey {
		case assignees = "assignees"
		case body = "body"
		case labels = "labels"
		case milestone = "milestone"
		case title = "title"
	}
    
    public init(title: String) {
        self.assignees = nil
        self.body = nil
        self.labels = nil
        self.milestone = nil
        self.title = title
    }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		assignees = try values.decodeIfPresent([String].self, forKey: .assignees)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		labels = try values.decodeIfPresent([String].self, forKey: .labels)
		milestone = try values.decodeIfPresent(Int.self, forKey: .milestone)
		title = try values.decodeIfPresent(String.self, forKey: .title)
	}
}
