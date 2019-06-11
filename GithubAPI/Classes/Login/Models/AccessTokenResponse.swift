//
//  AccessTokenResponse.swift
//  BaseAPI
//
//  Created by Serhii Londar on 6/7/19.
//

import Foundation

public struct AccessTokenResponse: Codable {
    public let accessToken: String
    public let tokenType: String
    public let scope: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope = "scope"
    }
}
