//
//	RepositoryPermission.swift
//
//	Create by Serhii Londar on 21/1/2018
//	Copyright © 2018 Techmagic. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct RepositoryPermission : Codable {
	public let admin : Bool?
	public let pull : Bool?
	public let push : Bool?

	enum CodingKeys: String, CodingKey {
		case admin = "admin"
		case pull = "pull"
		case push = "push"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		admin = try values.decodeIfPresent(Bool.self, forKey: .admin)
		pull = try values.decodeIfPresent(Bool.self, forKey: .pull)
		push = try values.decodeIfPresent(Bool.self, forKey: .push)
	}
}
