//
//  UserAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/6/18.
//

import Foundation
import BaseAPI

public class UserAPI: GithubAPI {
    public func getUser(completion: @escaping(UserResponse?, Error?) -> Void) {
        self.get(path: "/user", completion: completion)
    }
    
    public func updateUser(user: UpdateUser, completion: @escaping(UserResponse?, Error?) -> Void) {
        let data = try? JSONEncoder().encode(user)
        self.patch(path: "/user", body: data, completion: completion)
    }
    
    public func getUser(username: String, completion: @escaping(OtherUserResponse?, Error?) -> Void) {
        let encodedUsername = username.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlPathAllowed)!
        self.get(path: "/users/\(encodedUsername)", completion: completion)
    }
    
    public func getAllUsers(since: String, completion: @escaping([AllUsersResponse]?, Error?) -> Void) {
        super.get(path: "/users?since=\(since)", completion: completion)
    }
    
}
