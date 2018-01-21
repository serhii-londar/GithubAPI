//
//  RepositoriesAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//

import Foundation
import BaseAPI

public enum RepositoriesVisibility: String {
    case all
    case `public`
    case `private`
}

public enum RepositoriesAffiliation: String {
    case owner
    case collaborator
    case organization_member
}

public enum RepositoriesType: String {
    case all
    case owner
    case `public`
    case `private`
    case member
}


public enum OrganizationRepositoriesType: String {
    case all
    case `public`
    case `private`
    case forks
    case sources
    case member
}

public enum RepositoriesSort: String {
    case created
    case updated
    case pushed
    case full_name
}

public enum RepositoriesDirection: String {
    case asc
    case desc
}

public class RepositoriesAPI: GithubAPI {
    public func repositories(visibility: RepositoriesVisibility? = nil, affiliation: [RepositoriesAffiliation]? = nil, type: RepositoriesType? = nil, sort: RepositoriesSort? = nil, direction: RepositoriesDirection? = nil, completion: @escaping([RepositoryResponse]?, Error?) -> Void) {
        let path = "/user/repos"
        var parameters = [String : String]()
        if let visibility = visibility {
            parameters["visibility"] = visibility.rawValue
        }
        if let affiliation = affiliation {
            if affiliation.count > 0 {
                var affiliationValue = ""
                for iterator in affiliation {
                    affiliationValue += iterator.rawValue + ","
                }
                affiliationValue.removeLast()
                parameters["affiliation"] = affiliationValue
            }
        }
        
        if let type = type {
            parameters["type"] = type.rawValue
        }
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        if let direction = direction {
            parameters["direction"] = direction.rawValue
        }
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    
    public func repositories(user: String, type: RepositoriesType? = nil, sort: RepositoriesSort? = nil, direction: RepositoriesDirection? = nil, completion: @escaping([RepositoryResponse]?, Error?) -> Void) {
        let path = "/users/\(user)/repos"
        var parameters = [String : String]()
        if let type = type {
            parameters["type"] = type.rawValue
        }
        if let sort = sort {
            parameters["sort"] = sort.rawValue
        }
        if let direction = direction {
            parameters["direction"] = direction.rawValue
        }
        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func repositories(organization: String, type: OrganizationRepositoriesType? = nil, completion: @escaping([RepositoryResponse]?, Error?) -> Void) {
        let path = "/orgs/\(organization)/repos"
        var parameters = [String : String]()
        if let type = type {
            parameters["type"] = type.rawValue
        }        
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func listRepositories(since: String, completion: @escaping([RepositoryResponse]?, Error?) -> Void) {
        let path = "/repositories"
        var parameters = [String : String]()
        parameters["since"] = since
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func get(owner: String, repo: String, completion: @escaping(RepositoryResponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)"
        self.get(path: path, completion: completion)
    }
}
