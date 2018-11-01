//
//  EventsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/1/18.
//

import Foundation

public class EventsAPI: GithubAPI {
	public func listOfPublicEvents(page: Int? = nil, completion: @escaping([EventResponse]?, Error?) -> Void) {
		let path = "/events"
		var parameters = [String : String]()
		if let page = page {
			parameters["page"] = String(page)
		}
		self.get(path: path, parameters: parameters, completion: completion)
	}

}
