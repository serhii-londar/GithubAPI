//
//  Authentication.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//

import Foundation

extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
            return nil
        }
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
    }
}

public enum AuthenticationType {
    case none
    case headers
    case parameters
}

public class Authentication {
    public var type: AuthenticationType {
        return .none
    }
    public init() {
        
    }
    
    public var key: String {
        return ""
    }
    
    public var value: String {
        return ""
    }
    
    public func headers() -> [String : String] {
        return [key : value]
    }
}

public class BasicAuthentication: Authentication {
    override public var type: AuthenticationType {
        return .headers
    }
    public var username: String
    public var password: String
    
    public init(username: String, password: String) {
        self.username = username
        self.password = password
    }
    
    override public var key: String {
        return "Authorization"
    }
    
    override public var value: String {
        let authorization = self.username + ":" + self.password
        return "Basic \(authorization.toBase64() ?? "")"
    }
    
    override public func headers() -> [String : String] {
        let authorization = self.username + ":" + self.password
        return ["Authorization": "Basic \(authorization.toBase64() ?? "")"]
    }
}

public class TokenAuthentication: Authentication {
    override public var type: AuthenticationType {
        return .headers
    }
    public var token: String 
    
    public init(token: String) {
        self.token = token
    }
    
    override public var key: String {
        return "Authorization"
    }
    
    override public var value: String {
        return "token \(self.token)"
    }
    
    override public func headers() -> [String : String] {
        return [self.key: "token \(self.token)"]
    }
}

public class AccessTokenAuthentication: Authentication {
    override public var type: AuthenticationType {
        return .parameters
    }
    public var access_token: String
    
    public init(access_token: String) {
        self.access_token = access_token
    }
    
    override public var key: String {
        return "access_token"
    }
    
    override public var value: String {
        return "\(self.access_token)"
    }
    
    override public func headers() -> [String : String] {
        return [self.key: "\(self.access_token)"]
    }
}

