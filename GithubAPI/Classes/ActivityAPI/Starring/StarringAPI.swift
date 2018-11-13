//
//  StarringAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

public class StarringAPI: GithubAPI {
    public func listStargazers(owner: String, repo: String, completion: @escaping([ListStargazersResponse]?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)/stargazers"
        self.get(path: path, completion: completion)
    }
}
