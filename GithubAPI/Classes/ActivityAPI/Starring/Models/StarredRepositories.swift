//
//  StarredRepositories.swift
//  GithubAPI
//
//  Created by Serhii Londar on 12/7/18.
//

import Foundation

public typealias ListStargazersResponse = [StarredRepositoryOwner]

public typealias StarredRepositoriesResponse = [StarredRepository]

public struct StarredRepository: Codable {
	public let id: Int?
	public let nodeID: String?
	public let name: String?
	public let fullName: String?
	public let owner: StarredRepositoryOwner?
    public let `private`: Bool?
	public let htmlURL: String?
	public let description: String?
	public let fork: Bool?
	public let url: String?
	public let archiveURL: String?
	public let assigneesURL: String?
	public let blobsURL: String?
	public let branchesURL: String?
	public let collaboratorsURL: String?
	public let commentsURL: String?
	public let commitsURL: String?
	public let compareURL: String?
	public let contentsURL: String?
	public let contributorsURL: String?
	public let deploymentsURL: String?
	public let downloadsURL: String?
	public let eventsURL: String?
	public let forksURL: String?
	public let gitCommitsURL: String?
	public let gitRefsURL: String?
	public let gitTagsURL: String?
	public let gitURL: String?
	public let issueCommentURL: String?
	public let issueEventsURL: String?
	public let issuesURL: String?
	public let keysURL: String?
	public let labelsURL: String?
	public let languagesURL: String?
	public let mergesURL: String?
	public let milestonesURL: String?
	public let notificationsURL: String?
	public let pullsURL: String?
	public let releasesURL: String?
	public let sshURL: String?
	public let stargazersURL: String?
	public let statusesURL: String?
	public let subscribersURL: String?
	public let subscriptionURL: String?
	public let tagsURL: String?
	public let teamsURL: String?
	public let treesURL: String?
	public let cloneURL: String?
	public let mirrorURL: String?
	public let hooksURL: String?
	public let svnURL: String?
	public let homepage: String?
	public let language: String?
	public let forksCount: Int?
	public let stargazersCount: Int?
	public let watchersCount: Int?
	public let size: Int?
	public let defaultBranch: String?
	public let openIssuesCount: Int?
	public let topics: [String]?
	public let hasIssues: Bool?
	public let hasProjects: Bool?
	public let hasWiki: Bool?
	public let hasPages: Bool?
	public let hasDownloads: Bool?
	public let archived: Bool?
	public let pushedAt: Date?
	public let createdAt: Date?
	public let updatedAt: Date?
	public let permissions: StarredRepositoryPermissions?
	public let allowRebaseMerge: Bool?
	public let allowSquashMerge: Bool?
	public let allowMergeCommit: Bool?
	public let subscribersCount: Int?
	public let networkCount: Int?
	
	enum CodingKeys: String, CodingKey {
		case id
		case nodeID = "node_id"
		case name
		case fullName = "full_name"
		case owner
        case `private`
		case htmlURL = "html_url"
		case description
		case fork
		case url
		case archiveURL = "archive_url"
		case assigneesURL = "assignees_url"
		case blobsURL = "blobs_url"
		case branchesURL = "branches_url"
		case collaboratorsURL = "collaborators_url"
		case commentsURL = "comments_url"
		case commitsURL = "commits_url"
		case compareURL = "compare_url"
		case contentsURL = "contents_url"
		case contributorsURL = "contributors_url"
		case deploymentsURL = "deployments_url"
		case downloadsURL = "downloads_url"
		case eventsURL = "events_url"
		case forksURL = "forks_url"
		case gitCommitsURL = "git_commits_url"
		case gitRefsURL = "git_refs_url"
		case gitTagsURL = "git_tags_url"
		case gitURL = "git_url"
		case issueCommentURL = "issue_comment_url"
		case issueEventsURL = "issue_events_url"
		case issuesURL = "issues_url"
		case keysURL = "keys_url"
		case labelsURL = "labels_url"
		case languagesURL = "languages_url"
		case mergesURL = "merges_url"
		case milestonesURL = "milestones_url"
		case notificationsURL = "notifications_url"
		case pullsURL = "pulls_url"
		case releasesURL = "releases_url"
		case sshURL = "ssh_url"
		case stargazersURL = "stargazers_url"
		case statusesURL = "statuses_url"
		case subscribersURL = "subscribers_url"
		case subscriptionURL = "subscription_url"
		case tagsURL = "tags_url"
		case teamsURL = "teams_url"
		case treesURL = "trees_url"
		case cloneURL = "clone_url"
		case mirrorURL = "mirror_url"
		case hooksURL = "hooks_url"
		case svnURL = "svn_url"
		case homepage
		case language
		case forksCount = "forks_count"
		case stargazersCount = "stargazers_count"
		case watchersCount = "watchers_count"
		case size
		case defaultBranch = "default_branch"
		case openIssuesCount = "open_issues_count"
		case topics
		case hasIssues = "has_issues"
		case hasProjects = "has_projects"
		case hasWiki = "has_wiki"
		case hasPages = "has_pages"
		case hasDownloads = "has_downloads"
		case archived
		case pushedAt = "pushed_at"
		case createdAt = "created_at"
		case updatedAt = "updated_at"
		case permissions
		case allowRebaseMerge = "allow_rebase_merge"
		case allowSquashMerge = "allow_squash_merge"
		case allowMergeCommit = "allow_merge_commit"
		case subscribersCount = "subscribers_count"
		case networkCount = "network_count"
	}
}

public struct StarredRepositoryOwner: Codable {
	public let login: String?
	public let id: Int?
	public let nodeID: String?
	public let avatarURL: String?
	public let gravatarID: String?
	public let url: String?
	public let htmlURL: String?
	public let followersURL: String?
	public let followingURL: String?
	public let gistsURL: String?
	public let starredURL: String?
	public let subscriptionsURL: String?
	public let organizationsURL: String?
	public let reposURL: String?
	public let eventsURL: String?
	public let receivedEventsURL: String?
	public let type: String?
	public let siteAdmin: Bool?
	
	enum CodingKeys: String, CodingKey {
		case login
		case id
		case nodeID = "node_id"
		case avatarURL = "avatar_url"
		case gravatarID = "gravatar_id"
		case url
		case htmlURL = "html_url"
		case followersURL = "followers_url"
		case followingURL = "following_url"
		case gistsURL = "gists_url"
		case starredURL = "starred_url"
		case subscriptionsURL = "subscriptions_url"
		case organizationsURL = "organizations_url"
		case reposURL = "repos_url"
		case eventsURL = "events_url"
		case receivedEventsURL = "received_events_url"
		case type
		case siteAdmin = "site_admin"
	}
}

public struct StarredRepositoryPermissions: Codable {
	public let admin: Bool?
	public let push: Bool?
	public let pull: Bool?
	
	enum CodingKeys: String, CodingKey {
		case admin
		case push
		case pull
	}
	
	public init(admin: Bool?, push: Bool?, pull: Bool?) {
		self.admin = admin
		self.push = push
		self.pull = pull
	}
}
