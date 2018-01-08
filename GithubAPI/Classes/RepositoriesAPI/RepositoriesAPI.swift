//
//  RepositoriesAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//

import UIKit
import BaseAPI

public enum RepositoriesType: String {
    case all
    case owner
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
    public func listUserRepositories(user: String, type: RepositoriesType = .member, sort: RepositoriesSort = .full_name, direction: RepositoriesDirection = .asc, completion: @escaping([ListUserRepositoriesResponse]?, Error?) -> Void) {
        let path = "/users/\(user)/repos"
        var parameters = [String : String]()
        parameters["type"] = type.rawValue
        parameters["sort"] = sort.rawValue
        parameters["direction"] = direction.rawValue
        self.get(path: path, parameters: parameters, completion: completion)
    }
}
