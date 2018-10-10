//
//	SearchIssuesMilestone.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchIssuesMilestone : Codable {
	public let closedAt : String?
	public let closedIssues : Int?
	public let createdAt : String?
	public let creator : SearchIssuesMilestoneCreator?
	public let descriptionField : String?
	public let dueOn : String?
	public let htmlUrl : String?
	public let id : Int?
	public let labelsUrl : String?
	public let number : Int?
	public let openIssues : Int?
	public let state : String?
	public let title : String?
	public let updatedAt : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case closedAt = "closed_at"
		case closedIssues = "closed_issues"
		case createdAt = "created_at"
		case creator
		case descriptionField = "description"
		case dueOn = "due_on"
		case htmlUrl = "html_url"
		case id = "id"
		case labelsUrl = "labels_url"
		case number = "number"
		case openIssues = "open_issues"
		case state = "state"
		case title = "title"
		case updatedAt = "updated_at"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		closedAt = try values.decodeIfPresent(String.self, forKey: .closedAt)
		closedIssues = try values.decodeIfPresent(Int.self, forKey: .closedIssues)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		creator = try values.decodeIfPresent(SearchIssuesMilestoneCreator.self, forKey: .creator)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		dueOn = try values.decodeIfPresent(String.self, forKey: .dueOn)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		openIssues = try values.decodeIfPresent(Int.self, forKey: .openIssues)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
