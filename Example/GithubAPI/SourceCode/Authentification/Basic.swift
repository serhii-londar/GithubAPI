//
//	Basic.swift
//
//	Create by Serhii Londar on 9/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Basic : Codable {

	let password : String?
	let username : String?


	enum CodingKeys: String, CodingKey {
		case password = "password"
		case username = "username"
	}
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		password = try values.decodeIfPresent(String.self, forKey: .password)
		username = try values.decodeIfPresent(String.self, forKey: .username)
	}


}
