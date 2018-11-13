//
//	SearchIssuesItem.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchIssuesItem : Codable {
	public let assignee : SearchIssuesAssignee?
    public let assignees : [SearchIssuesAssignee]?
	public let body : String?
	public let closedAt : String?
	public let comments : Int?
	public let commentsUrl : String?
	public let createdAt : String?
	public let eventsUrl : String?
	public let htmlUrl : String?
	public let id : Int?
	public let labels : [SearchIssuesLabel]?
	public let labelsUrl : String?
	public let milestone : SearchIssuesMilestone?
	public let number : Int?
	public let pullRequest : SearchIssuesPullRequest?
	public let repositoryUrl : String?
	public let score : Float?
	public let state : String?
	public let title : String?
	public let updatedAt : String?
	public let url : String?
	public let user : SearchIssuesUser?

	enum CodingKeys: String, CodingKey {
		case assignee
        case assignees
		case body
		case closedAt = "closed_at"
		case comments
		case commentsUrl = "comments_url"
		case createdAt = "created_at"
		case eventsUrl = "events_url"
		case htmlUrl = "html_url"
		case id
		case labels
		case labelsUrl = "labels_url"
		case milestone
		case number
		case pullRequest = "pull_request"
		case repositoryUrl = "repository_url"
		case score
		case state
		case title
		case updatedAt = "updated_at"
		case url
		case user
	}
    
	public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
		assignee = try values.decodeIfPresent(SearchIssuesAssignee.self, forKey: .assignee)
        assignees = try values.decodeIfPresent([SearchIssuesAssignee].self, forKey: .assignees)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		closedAt = try values.decodeIfPresent(String.self, forKey: .closedAt)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
		commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		labels = try values.decodeIfPresent([SearchIssuesLabel].self, forKey: .labels)
		labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
		milestone = try values.decodeIfPresent(SearchIssuesMilestone.self, forKey: .milestone)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		pullRequest = try values.decodeIfPresent(SearchIssuesPullRequest.self, forKey: .pullRequest)
		repositoryUrl = try values.decodeIfPresent(String.self, forKey: .repositoryUrl)
		score = try values.decodeIfPresent(Float.self, forKey: .score)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		user = try values.decodeIfPresent(SearchIssuesUser.self, forKey: .user)
	}
}
