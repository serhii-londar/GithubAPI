//
//  RepositoriesContentsAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/21/18.
//

import Foundation
import BaseAPI

public class RepositoriesContentsAPI: GithubAPI {
    public func getReadme(owner: String, repo: String, ref: String? = nil, completion: @escaping(RepositoryContentsReponse?, Error?) -> Void) {
        let path = "/repos/\(owner)/\(repo)/readme"
        var parameters: [String : String]? = nil
        if let ref = ref {
            parameters = [String : String]()
            parameters!["ref"] = ref
        }
        self.get(path: path, parameters: parameters, completion: completion)
    }
    
    public func getReadmeSync(owner: String, repo: String, ref: String? = nil) -> (response: RepositoryContentsReponse?, error: Error?) {
        let path = "/repos/\(owner)/\(repo)/readme"
        var parameters: [String : String]? = nil
        if let ref = ref {
            parameters = [String : String]()
            parameters!["ref"] = ref
        }
        return self.getSync(path: path, parameters: parameters, headers: nil)
    }
}
