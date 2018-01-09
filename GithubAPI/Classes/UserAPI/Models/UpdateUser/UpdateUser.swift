//
//	UpdateUser.swift
//
//	Create by Serhii Londar on 7/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct UpdateUser : Codable {
	public var bio : String?
	public var blog : String?
	public var company : String?
	public var email : String?
	public var hireable : Bool?
	public var location : String?
    public var name : String?

	enum CodingKeys: String, CodingKey {
		case bio = "bio"
		case blog = "blog"
		case company = "company"
		case email = "email"
		case hireable = "hireable"
		case location = "location"
		case name = "name"
	}
    
    public init() {
        bio = nil
        blog = nil
        company = nil
        email = nil
        hireable = nil
        location = nil
        name = nil
    }
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		bio = try values.decodeIfPresent(String.self, forKey: .bio)
		blog = try values.decodeIfPresent(String.self, forKey: .blog)
		company = try values.decodeIfPresent(String.self, forKey: .company)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		hireable = try values.decodeIfPresent(Bool.self, forKey: .hireable)
		location = try values.decodeIfPresent(String.self, forKey: .location)
		name = try values.decodeIfPresent(String.self, forKey: .name)
	}
}
