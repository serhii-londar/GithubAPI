//
//  NotificationsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/9/18.
//

import Foundation

enum NotificationReasons: String {
    case assign
    case author
    case comment
    case invitation
    case manual
    case mention
    case state_change
    case subscribed
    case team_mention
}

public class NotificationsAPI: GithubAPI {
    public func notifications(all: Bool = false, participating: Bool = false, since: String? = nil, before: String? = nil, completion: @escaping([NotificationsResponse]?, Error?) -> Void) {
        let path = "/notifications"
        var parameters = [String : String]()
        parameters["all"] = String(all)
        parameters["participating"] = String(participating)
        if let since = since {
            parameters["since"] = since
        }
        if let before = before {
            parameters["before"] = before
        }
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func repositoryNotifications(owner: String, repository: String, all: Bool = false, participating: Bool = false, since: String? = nil, before: String? = nil, completion: @escaping([NotificationsResponse]?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/notifications"
        var parameters = [String : String]()
        parameters["all"] = String(all)
        parameters["participating"] = String(participating)
        if let since = since {
            parameters["since"] = since
        }
        if let before = before {
            parameters["before"] = before
        }
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func markAsRead(last_read_at: String, completion: @escaping(Bool?, Error?) -> Void) {
        let path = "/notifications"
        var parameters = [String : String]()
        parameters["last_read_at"] = last_read_at
        self.put(path: path, parameters: parameters, headers: nil, body: nil, completion: completion)
    }
    
    public func markAsRead(owner: String, repository: String, last_read_at: String, completion: @escaping(Bool?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/notifications"
        var parameters = [String : String]()
        parameters["last_read_at"] = last_read_at
        self.put(path: path, parameters: parameters, headers: nil, body: nil, completion: completion)
    }
}
