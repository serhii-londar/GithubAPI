//
//  GithubAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//  Copyright © 2018 Serhii Londar. All rights reserved.
//

import Foundation

public enum SearchOrder: String {
    case asc
    case desc
}

public enum SearchRepositoriesSort: String{
    case stars
    case forks
    case updated
}

public enum SearchCommitsSort: String{
    case authorDate = "author-date"
    case committerDate = "committer-date"
}

public enum SearchCodeSort: String{
    case bestMatch = "best-match"
    case recentlyIndexed = "recently-indexed"
    case leastRecentlyIndexed = "least-recently-indexed"
}

public enum SearchIssuesSort: String{
    case comments
    case created
    case updated
}

public enum SearchUsersSort: String{
    case followers
    case repositories
    case joined
}

public class SearchAPI: GithubAPI {    
    public func searchRepositories(q: String, page: Int = 1, per_page: Int = 100, sort: SearchRepositoriesSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchRepositoriesResponse?, Error?) -> Swift.Void) {
        let path = "/search/repositories"
        var parameters = [String : String]()
        parameters["q"] = q
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func searchCommits(q: String, page: Int = 1, per_page: Int = 100, sort: SearchCommitsSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchCommitsResponse?, Error?) -> Swift.Void) {
        let path = "/search/commits"
        var parameters = [String : String]()
        parameters["q"] = q
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func searchCode(q: String, page: Int = 1, per_page: Int = 100, sort: SearchCodeSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchCodeResponse?, Error?) -> Swift.Void) {
        let path = "/search/code"
        var parameters = [String : String]()
        parameters["q"] = q
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func searchIssues(q: String, page: Int = 1, per_page: Int = 100, sort: SearchIssuesSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchIssuesResponse?, Error?) -> Swift.Void) {
        let path = "/search/issues"
        var parameters = [String : String]()
        parameters["q"] = q
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func searchUsers(q: String, page: Int = 1, per_page: Int = 100, sort: SearchUsersSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchUsersResponse?, Error?) -> Swift.Void) {
        let path = "/search/users"
        var parameters = [String : String]()
        parameters["q"] = q
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
}
