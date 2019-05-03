//
//  FeedsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 11/13/18.
//

import Foundation

public class FeedsAPI: GithubAPI {
    public func listFeeds(page: Int? = nil, completion: @escaping(FeedsResponse?, Error?) -> Void) {
        let path = "/feeds"
        self.gh_get(path: path, completion: completion)
    }
}
