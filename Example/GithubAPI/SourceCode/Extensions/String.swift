//
//  String.swift
//  GithubAPI_Example
//
//  Created by Serhii Londar on 6/7/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

extension String {
    func fromBase64(options: Data.Base64DecodingOptions) -> String? {
        guard let data = Data(base64Encoded: self, options: options) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions.ignoreUnknownCharacters) else {
            return nil
        }
        
        return String(data: data as Data, encoding: String.Encoding.utf8)
    }
    
    func toBase64() -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString()
    }
    
    func toBase64(options: Data.Base64EncodingOptions) -> String? {
        guard let data = self.data(using: String.Encoding.utf8) else {
            return nil
        }
        
        return data.base64EncodedString(options: options)
    }
}
