//
//  EventRepo.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 1, 2018

import Foundation

public struct EventResponseRepo : Codable {
	public let id : Int?
	public let name : String?
	public let url : String?
	
	enum CodingKeys: String, CodingKey {
		case id
		case name
		case url
	}
	
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		url = try values.decodeIfPresent(String.self, forKey: .url)
	}
}
