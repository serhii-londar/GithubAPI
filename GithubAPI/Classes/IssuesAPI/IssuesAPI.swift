//
//  IssuesAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/8/18.
//

import Foundation

public enum IssueFilter: String {
    case assigned
    case created
    case mentioned
    case subscribed
    case all
}

public enum IssueState: String {
    case open
    case closed
    case all
}

public enum IssueSort: String {
    case created
    case updated
    case comments
}

public enum IssueDirection: String {
    case asc
    case desc
}

public class IssuesAPI: GithubAPI {
    /// List all issues assigned to the authenticated user across all visible repositories including owned repositories, member repositories, and organization repositories:
    ///
    /// - Parameter completion:
    public func getIssues(filter: IssueFilter = .assigned, state: IssueState = .open, labels: [String] = [], sort: IssueSort = .created, direction: IssueDirection = .desc, /*since: TimeInterval,*/ completion: @escaping([GetIssueResponse]?, Error?) -> Void) {
        let path = "/issues"
        var parameters = [String : String]()
        parameters["filter"] = filter.rawValue
        parameters["state"] = state.rawValue
        if labels.count > 0 {
            var labelsString = ""
            for label in labels {
                labelsString += label + ","
            }
            labelsString.removeLast()
            parameters["labels"] = labelsString
        }
        parameters["sort"] = sort.rawValue
        parameters["direction"] = direction.rawValue
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    /// List all issues across owned and member repositories assigned to the authenticated user:
    ///
    /// - Parameter completion:
    public func getUserIssues(filter: IssueFilter = .assigned, state: IssueState = .open, labels: [String] = [], sort: IssueSort = .created, direction: IssueDirection = .desc, completion: @escaping([GetIssueResponse]?, Error?) -> Void) {
        let path = "/user/issues"
        var parameters = [String : String]()
        parameters["filter"] = filter.rawValue
        parameters["state"] = state.rawValue
        if labels.count > 0 {
            var labelsString = ""
            for label in labels {
                labelsString += label + ","
            }
            labelsString.removeLast()
            parameters["labels"] = labelsString
        }
        parameters["sort"] = sort.rawValue
        parameters["direction"] = direction.rawValue
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func getUserIssues(organization: String, filter: IssueFilter = .assigned, state: IssueState = .open, labels: [String] = [], sort: IssueSort = .created, direction: IssueDirection = .desc,  completion: @escaping([GetIssueResponse]?, Error?) -> Void) {
        let path = "/orgs/\(organization)/issues"
        var parameters = [String : String]()
        parameters["filter"] = filter.rawValue
        parameters["state"] = state.rawValue
        if labels.count > 0 {
            var labelsString = ""
            for label in labels {
                labelsString += label + ","
            }
            labelsString.removeLast()
            parameters["labels"] = labelsString
        }
        parameters["sort"] = sort.rawValue
        parameters["direction"] = direction.rawValue
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func getRepositoryIssues(owner: String, repository: String, milestone: String? = nil, state: IssueState = .open, assignee: String? = nil, creator: String? = nil, mentioned: String? = nil, labels: [String] = [], sort: IssueSort = .created, direction: IssueDirection = .desc,  completion: @escaping([GetIssueResponse]?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/issues"
        var parameters = [String : String]()
        if let milestone = milestone {
            parameters["milestone"] = milestone
        }
        parameters["state"] = state.rawValue
        if let assignee = assignee {
            parameters["assignee"] = assignee
        }
        if let creator = creator {
            parameters["creator"] = creator
        }
        if let mentioned = mentioned {
            parameters["mentioned"] = mentioned
        }
        if labels.count > 0 {
            var labelsString = ""
            for label in labels {
                labelsString += label + ","
            }
            labelsString.removeLast()
            parameters["labels"] = labelsString
        }
        parameters["sort"] = sort.rawValue
        parameters["direction"] = direction.rawValue
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func getIssue(owner: String, repository: String, number: Int, completion: @escaping(GetIssueResponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/issues/\(number)"
        self.get(path: path, completion: completion)
    }
    
    public func createIssue(owner: String, repository: String, issue: Issue, completion: @escaping(GetIssueResponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/issues"
        self.post(path: path, body: try? JSONEncoder().encode(issue), completion: completion)
    }
    
    public func updateIssue(owner: String, repository: String, number: Int, issue: Issue, completion: @escaping(GetIssueResponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repository)/issues/\(number)"
        self.patch(path: path, body: try? JSONEncoder().encode(issue), completion: completion)
    }
}
