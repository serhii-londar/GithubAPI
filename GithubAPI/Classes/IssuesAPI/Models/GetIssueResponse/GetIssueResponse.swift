//
//	GetIssueResponse.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct GetIssueResponse : Codable {
	public let assignee : GetIssueResponseAssignee?
	public let assignees : [GetIssueResponseAssignee]?
	public let body : String?
	public let closedAt : String?
	public let comments : Int?
	public let commentsUrl : String?
	public let createdAt : String?
	public let eventsUrl : String?
	public let htmlUrl : String?
	public let id : Int?
	public let labels : [GetIssueResponseLabel]?
	public let labelsUrl : String?
	public let locked : Bool?
	public let milestone : GetIssueResponseMilestone?
	public let number : Int?
	public let pullRequest : GetIssueResponsePullRequest?
	public let repository : GetIssueResponseRepository?
	public let repositoryUrl : String?
	public let state : String?
	public let title : String?
	public let updatedAt : String?
	public let url : String?
	public let user : GetIssueResponseAssignee?


	enum CodingKeys: String, CodingKey {
		case assignee
		case assignees = "assignees"
		case body = "body"
		case closedAt = "closed_at"
		case comments = "comments"
		case commentsUrl = "comments_url"
		case createdAt = "created_at"
		case eventsUrl = "events_url"
		case htmlUrl = "html_url"
		case id = "id"
		case labels = "labels"
		case labelsUrl = "labels_url"
		case locked = "locked"
		case milestone
		case number = "number"
		case pullRequest
		case repository
		case repositoryUrl = "repository_url"
		case state = "state"
		case title = "title"
		case updatedAt = "updated_at"
		case url = "url"
		case user
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		assignee = try values.decodeIfPresent(GetIssueResponseAssignee.self, forKey: .assignee)
		assignees = try values.decodeIfPresent([GetIssueResponseAssignee].self, forKey: .assignees)
		body = try values.decodeIfPresent(String.self, forKey: .body)
		closedAt = try values.decodeIfPresent(String.self, forKey: .closedAt)
		comments = try values.decodeIfPresent(Int.self, forKey: .comments)
		commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		labels = try values.decodeIfPresent([GetIssueResponseLabel].self, forKey: .labels)
		labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
		locked = try values.decodeIfPresent(Bool.self, forKey: .locked)
		milestone = try values.decodeIfPresent(GetIssueResponseMilestone.self, forKey: .milestone)
		number = try values.decodeIfPresent(Int.self, forKey: .number)
		pullRequest = try values.decodeIfPresent(GetIssueResponsePullRequest.self, forKey: .pullRequest)
		repository = try values.decodeIfPresent(GetIssueResponseRepository.self, forKey: .repository)
		repositoryUrl = try values.decodeIfPresent(String.self, forKey: .repositoryUrl)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		updatedAt = try values.decodeIfPresent(String.self, forKey: .updatedAt)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		user = try values.decodeIfPresent(GetIssueResponseAssignee.self, forKey: .user)
	}
}
