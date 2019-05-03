//
//  EventsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/1/18.
//

import Foundation

public class EventsAPI: GithubAPI {
	/// List public events.
	///
	/// We delay the public events feed by five minutes, which means the most recent event returned by the public events API actually occurred at least five minutes ago.
	///
	/// - Parameters:
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listOfPublicEvents(page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}

	/// List repository events
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listRepositoryEvents(owner: String, repo: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List issue events for a repository
	///
	/// Repository issue events have a different format than other events, as documented in the [Issue Events API](https://developer.github.com/v3/issues/events/).
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listIssueEventsForARepository(owner: String, repo: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/repos/\(owner)/\(repo)/issues/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List public events for a network of repositories
	///
	/// - Parameters:
	///   - owner: Repository owner.
	///   - repo: Repository name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listPublicEventsForANetworkOfRepositories(owner: String, repo: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/networks/\(owner)/\(repo)/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List public events for an organization
	///
	/// - Parameters:
	///   - org: Organization name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listPublicEventsForAnOrganization(org: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/orgs/\(org)/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List events that a user has received
	///
	/// These are events that you've received by watching repos and following users. If you are authenticated as the given user, you will see private events. Otherwise, you'll only see public events.
	///
	/// - Parameters:
	///   - username: User name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listEventsThatAUserHasReceived(username: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/received_events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}

	/// List public events that a user has received
	///
	/// - Parameters:
	///   - username: User name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listPublicEventsThatAUserHasReceived(username: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/received_events/public"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List events performed by a user
	///
	/// If you are authenticated as the given user, you will see your private events. Otherwise, you'll only see public events.
    ///
	/// - Parameters:
	///   - username: User name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listEventsPerformedByAUser(username: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List public events performed by a user
	///
	/// - Parameters:
	///   - username: User name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listPublicEventsPerformedByAUser(username: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
	
	/// List events for an organization
	///
	/// This is the user's organization dashboard. You must be authenticated as the user to view this.
	///
	/// - Parameters:
	///   - username: User name.
	///   - org: Organization name.
	///   - page: Events page.
	///   - completion: Completion handler.
	public func listEventsForAnOrganization(username: String, org: String, page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/users/\(username)/events/orgs/\(org)"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.gh_get(path: path, parameters: parameters, completion: completion)
	}
}
