//
//	SearchIssuesResponse.swift
//
//	Create by Serhii Londar on 8/1/2018
//	Copyright © 2018 Serhii Londar. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

public struct SearchIssuesResponse : Codable {
	public let incompleteResults : Bool?
	public let items : [SearchIssuesItem]?
	public let totalCount : Int?

	enum CodingKeys: String, CodingKey {
		case incompleteResults = "incomplete_results"
		case items = "items"
		case totalCount = "total_count"
	}
    
	public init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		incompleteResults = try values.decodeIfPresent(Bool.self, forKey: .incompleteResults)
		items = try values.decodeIfPresent([SearchIssuesItem].self, forKey: .items)
		totalCount = try values.decodeIfPresent(Int.self, forKey: .totalCount)
	}
}
