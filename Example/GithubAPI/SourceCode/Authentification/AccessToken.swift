//
//	AccessToken.swift
//
//	Create by Serhii Londar on 9/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct AccessToken : Codable {
	let accessToken : String?
	let key : String?
    
	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case key = "key"
	}
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
		key = try values.decodeIfPresent(String.self, forKey: .key)
	}
}
