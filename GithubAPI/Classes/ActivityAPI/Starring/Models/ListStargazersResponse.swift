//
//  ListStargazersResponse.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

public typealias ListStargazersResponse = [ListStargazers]

public struct ListStargazers: Codable {
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
    
    public init(login: String?, id: Int?, nodeID: String?, avatarURL: String?, gravatarID: String?, url: String?, htmlURL: String?, followersURL: String?, followingURL: String?, gistsURL: String?, starredURL: String?, subscriptionsURL: String?, organizationsURL: String?, reposURL: String?, eventsURL: String?, receivedEventsURL: String?, type: String?, siteAdmin: Bool?) {
        self.login = login
        self.id = id
        self.nodeID = nodeID
        self.avatarURL = avatarURL
        self.gravatarID = gravatarID
        self.url = url
        self.htmlURL = htmlURL
        self.followersURL = followersURL
        self.followingURL = followingURL
        self.gistsURL = gistsURL
        self.starredURL = starredURL
        self.subscriptionsURL = subscriptionsURL
        self.organizationsURL = organizationsURL
        self.reposURL = reposURL
        self.eventsURL = eventsURL
        self.receivedEventsURL = receivedEventsURL
        self.type = type
        self.siteAdmin = siteAdmin
    }
}

