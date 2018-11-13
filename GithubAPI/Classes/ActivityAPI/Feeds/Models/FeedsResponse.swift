//
//  FeedsResponse.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

public struct FeedsResponse: Codable {
    public let timelineURL: String?
    public let userURL: String?
    public let currentUserPublicURL: String?
    public let currentUserURL: String?
    public let currentUserActorURL: String?
    public let currentUserOrganizationURL: String?
    public let currentUserOrganizationUrls: [String]?
    public let securityAdvisoriesURL: String?
    public let links: FeedsResponseLinks?
    
    enum CodingKeys: String, CodingKey {
        case timelineURL = "timeline_url"
        case userURL = "user_url"
        case currentUserPublicURL = "current_user_public_url"
        case currentUserURL = "current_user_url"
        case currentUserActorURL = "current_user_actor_url"
        case currentUserOrganizationURL = "current_user_organization_url"
        case currentUserOrganizationUrls = "current_user_organization_urls"
        case securityAdvisoriesURL = "security_advisories_url"
        case links = "_links"
    }
    
    public init(timelineURL: String?, userURL: String?, currentUserPublicURL: String?, currentUserURL: String?, currentUserActorURL: String?, currentUserOrganizationURL: String?, currentUserOrganizationUrls: [String]?, securityAdvisoriesURL: String?, links: FeedsResponseLinks?) {
        self.timelineURL = timelineURL
        self.userURL = userURL
        self.currentUserPublicURL = currentUserPublicURL
        self.currentUserURL = currentUserURL
        self.currentUserActorURL = currentUserActorURL
        self.currentUserOrganizationURL = currentUserOrganizationURL
        self.currentUserOrganizationUrls = currentUserOrganizationUrls
        self.securityAdvisoriesURL = securityAdvisoriesURL
        self.links = links
    }
}

public struct FeedsResponseLinks: Codable {
    public let timeline: FeedsResponseCurrentUser?
    public let user: FeedsResponseCurrentUser?
    public let currentUserPublic: FeedsResponseCurrentUser?
    public let currentUser: FeedsResponseCurrentUser?
    public let currentUserActor: FeedsResponseCurrentUser?
    public let currentUserOrganization: FeedsResponseCurrentUser?
    public let currentUserOrganizations: [FeedsResponseCurrentUser]?
    public let securityAdvisories: FeedsResponseCurrentUser?
    
    enum CodingKeys: String, CodingKey {
        case timeline
        case user
        case currentUserPublic = "current_user_public"
        case currentUser = "current_user"
        case currentUserActor = "current_user_actor"
        case currentUserOrganization = "current_user_organization"
        case currentUserOrganizations = "current_user_organizations"
        case securityAdvisories = "security_advisories"
    }
    
    public init(timeline: FeedsResponseCurrentUser?, user: FeedsResponseCurrentUser?, currentUserPublic: FeedsResponseCurrentUser?, currentUser: FeedsResponseCurrentUser?, currentUserActor: FeedsResponseCurrentUser?, currentUserOrganization: FeedsResponseCurrentUser?, currentUserOrganizations: [FeedsResponseCurrentUser]?, securityAdvisories: FeedsResponseCurrentUser?) {
        self.timeline = timeline
        self.user = user
        self.currentUserPublic = currentUserPublic
        self.currentUser = currentUser
        self.currentUserActor = currentUserActor
        self.currentUserOrganization = currentUserOrganization
        self.currentUserOrganizations = currentUserOrganizations
        self.securityAdvisories = securityAdvisories
    }
}

public struct FeedsResponseCurrentUser: Codable {
    public let href: String?
    public let type: String?
    
    enum CodingKeys: String, CodingKey {
        case href
        case type
    }
    
    public init(href: String?, type: String?) {
        self.href = href
        self.type = type
    }
}
