//
//  GithubAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//  Copyright © 2018 slon. All rights reserved.
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

public class SearchAPI: GithubAPI {
    
    public override init() {
        super.init()
    }
    
    public func searchRepositories(q: String, page: Int = 1, per_page: Int = 100, sort: SearchRepositoriesSort? = nil, order: SearchOrder = .desc, completion: @escaping (SearchRepositoriesResponse?, Error?) -> Swift.Void) {
        let path = "/search/repositories"
        var parameters = [String : String]()
        parameters["q"] = q.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        parameters["order"] = order.rawValue
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        parameters["page"] = "\(page)"
        parameters["per_page"] = "\(per_page)"
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
}
