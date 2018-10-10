//
//	SearchCodeRepository.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchCodeRepository : Codable {
	public let archiveUrl : String?
	public let assigneesUrl : String?
	public let blobsUrl : String?
	public let branchesUrl : String?
	public let collaboratorsUrl : String?
	public let commentsUrl : String?
	public let commitsUrl : String?
	public let compareUrl : String?
	public let contentsUrl : String?
	public let contributorsUrl : String?
	public let descriptionField : String?
	public let downloadsUrl : String?
	public let eventsUrl : String?
	public let fork : Bool?
	public let forksUrl : String?
	public let fullName : String?
	public let gitCommitsUrl : String?
	public let gitRefsUrl : String?
	public let gitTagsUrl : String?
	public let hooksUrl : String?
	public let htmlUrl : String?
	public let id : Int?
	public let issueCommentUrl : String?
	public let issueEventsUrl : String?
	public let issuesUrl : String?
	public let keysUrl : String?
	public let labelsUrl : String?
	public let languagesUrl : String?
	public let mergesUrl : String?
	public let milestonesUrl : String?
	public let name : String?
	public let notificationsUrl : String?
	public let owner : SearchCodeOwner?
	public let privateField : Bool?
	public let pullsUrl : String?
	public let stargazersUrl : String?
	public let statusesUrl : String?
	public let subscribersUrl : String?
	public let subscriptionUrl : String?
	public let tagsUrl : String?
	public let teamsUrl : String?
	public let treesUrl : String?
	public let url : String?

	enum CodingKeys: String, CodingKey {
		case archiveUrl = "archive_url"
		case assigneesUrl = "assignees_url"
		case blobsUrl = "blobs_url"
		case branchesUrl = "branches_url"
		case collaboratorsUrl = "collaborators_url"
		case commentsUrl = "comments_url"
		case commitsUrl = "commits_url"
		case compareUrl = "compare_url"
		case contentsUrl = "contents_url"
		case contributorsUrl = "contributors_url"
		case descriptionField = "description"
		case downloadsUrl = "downloads_url"
		case eventsUrl = "events_url"
		case fork = "fork"
		case forksUrl = "forks_url"
		case fullName = "full_name"
		case gitCommitsUrl = "git_commits_url"
		case gitRefsUrl = "git_refs_url"
		case gitTagsUrl = "git_tags_url"
		case hooksUrl = "hooks_url"
		case htmlUrl = "html_url"
		case id = "id"
		case issueCommentUrl = "issue_comment_url"
		case issueEventsUrl = "issue_events_url"
		case issuesUrl = "issues_url"
		case keysUrl = "keys_url"
		case labelsUrl = "labels_url"
		case languagesUrl = "languages_url"
		case mergesUrl = "merges_url"
		case milestonesUrl = "milestones_url"
		case name = "name"
		case notificationsUrl = "notifications_url"
		case owner
		case privateField = "private"
		case pullsUrl = "pulls_url"
		case stargazersUrl = "stargazers_url"
		case statusesUrl = "statuses_url"
		case subscribersUrl = "subscribers_url"
		case subscriptionUrl = "subscription_url"
		case tagsUrl = "tags_url"
		case teamsUrl = "teams_url"
		case treesUrl = "trees_url"
		case url = "url"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		archiveUrl = try values.decodeIfPresent(String.self, forKey: .archiveUrl)
		assigneesUrl = try values.decodeIfPresent(String.self, forKey: .assigneesUrl)
		blobsUrl = try values.decodeIfPresent(String.self, forKey: .blobsUrl)
		branchesUrl = try values.decodeIfPresent(String.self, forKey: .branchesUrl)
		collaboratorsUrl = try values.decodeIfPresent(String.self, forKey: .collaboratorsUrl)
		commentsUrl = try values.decodeIfPresent(String.self, forKey: .commentsUrl)
		commitsUrl = try values.decodeIfPresent(String.self, forKey: .commitsUrl)
		compareUrl = try values.decodeIfPresent(String.self, forKey: .compareUrl)
		contentsUrl = try values.decodeIfPresent(String.self, forKey: .contentsUrl)
		contributorsUrl = try values.decodeIfPresent(String.self, forKey: .contributorsUrl)
		descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
		downloadsUrl = try values.decodeIfPresent(String.self, forKey: .downloadsUrl)
		eventsUrl = try values.decodeIfPresent(String.self, forKey: .eventsUrl)
		fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
		forksUrl = try values.decodeIfPresent(String.self, forKey: .forksUrl)
		fullName = try values.decodeIfPresent(String.self, forKey: .fullName)
		gitCommitsUrl = try values.decodeIfPresent(String.self, forKey: .gitCommitsUrl)
		gitRefsUrl = try values.decodeIfPresent(String.self, forKey: .gitRefsUrl)
		gitTagsUrl = try values.decodeIfPresent(String.self, forKey: .gitTagsUrl)
		hooksUrl = try values.decodeIfPresent(String.self, forKey: .hooksUrl)
		htmlUrl = try values.decodeIfPresent(String.self, forKey: .htmlUrl)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		issueCommentUrl = try values.decodeIfPresent(String.self, forKey: .issueCommentUrl)
		issueEventsUrl = try values.decodeIfPresent(String.self, forKey: .issueEventsUrl)
		issuesUrl = try values.decodeIfPresent(String.self, forKey: .issuesUrl)
		keysUrl = try values.decodeIfPresent(String.self, forKey: .keysUrl)
		labelsUrl = try values.decodeIfPresent(String.self, forKey: .labelsUrl)
		languagesUrl = try values.decodeIfPresent(String.self, forKey: .languagesUrl)
		mergesUrl = try values.decodeIfPresent(String.self, forKey: .mergesUrl)
		milestonesUrl = try values.decodeIfPresent(String.self, forKey: .milestonesUrl)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		notificationsUrl = try values.decodeIfPresent(String.self, forKey: .notificationsUrl)
		owner = try values.decodeIfPresent(SearchCodeOwner.self, forKey: .owner)
		privateField = try values.decodeIfPresent(Bool.self, forKey: .privateField)
		pullsUrl = try values.decodeIfPresent(String.self, forKey: .pullsUrl)
		stargazersUrl = try values.decodeIfPresent(String.self, forKey: .stargazersUrl)
		statusesUrl = try values.decodeIfPresent(String.self, forKey: .statusesUrl)
		subscribersUrl = try values.decodeIfPresent(String.self, forKey: .subscribersUrl)
		subscriptionUrl = try values.decodeIfPresent(String.self, forKey: .subscriptionUrl)
		tagsUrl = try values.decodeIfPresent(String.self, forKey: .tagsUrl)
		teamsUrl = try values.decodeIfPresent(String.self, forKey: .teamsUrl)
		treesUrl = try values.decodeIfPresent(String.self, forKey: .treesUrl)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
