//
//	UserPlan.swift
//
//	Create by Serhii Londar on 7/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct UserPlan : Codable {
	public let collaborators : Int?
	public let name : String?
	public let privateRepos : Int?
	public let space : Int?
    
	enum CodingKeys: String, CodingKey {
		case collaborators = "collaborators"
		case name = "name"
		case privateRepos = "private_repos"
		case space = "space"
	}
	
    public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		collaborators = try values.decodeIfPresent(Int.self, forKey: .collaborators)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		privateRepos = try values.decodeIfPresent(Int.self, forKey: .privateRepos)
		space = try values.decodeIfPresent(Int.self, forKey: .space)
	}
}
