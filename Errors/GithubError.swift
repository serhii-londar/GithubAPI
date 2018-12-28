//
//  GithubError.swift
//  GithubAPI
//
//  Created by Serhii Londar on 12/28/18.
//

import Foundation

public class GithubError: Codable {
	public let message: String?
	public let errors: [GithubErrorError]?
	
	enum CodingKeys: String, CodingKey {
		case message
		case errors
	}
}

public class GithubErrorError: Codable {
	public let resource: String?
	public let field: String?
	public let code: String?
	
	enum CodingKeys: String, CodingKey {
		case resource
		case field
		case code
	}
}

extension GithubError: Error { }

