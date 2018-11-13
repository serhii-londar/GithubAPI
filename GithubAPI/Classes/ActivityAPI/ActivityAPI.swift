//
//  ActivityAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/1/18.
//

import Foundation

public class ActivityAPI {
    var authentication: Authentication?
    
    public init(authentication: Authentication? = nil) {
        self.authentication = authentication
    }
    
	public var notifications: NotificationsAPI {
        return NotificationsAPI(authentication: self.authentication)
	}
    
    public var events: EventsAPI {
        return EventsAPI(authentication: self.authentication)
    }
    
    public var feeds: FeedsAPI {
        return FeedsAPI(authentication: self.authentication)
    }
}
