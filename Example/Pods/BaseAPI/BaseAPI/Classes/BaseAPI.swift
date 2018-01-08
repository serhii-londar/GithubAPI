//
//  BaseAPI.swift
//  BaseAPI
//
//  Created by Serhii Londar on 12/8/17.
//

import Foundation

open class BaseAPI {
    public init() {
        
    }
    
    public func get(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .GET, parameters: parameters, headers: headers, body: nil)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
    
    public func head(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .HEAD, parameters: parameters, headers: headers, body: nil)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
    
    public func post(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .POST, parameters: parameters, headers: headers, body: body)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
    
    public func patch(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .PATCH, parameters: parameters, headers: headers, body: body)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
    
    public func put(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .PUT, parameters: parameters, headers: headers, body: body)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
    
    public func delete(url: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request = Request(url: url, method: .DELETE, parameters: parameters, headers: headers)
        let buildRequest = request.request()
        if let urlRequest = buildRequest.0 {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: completion)
            task.resume()
        } else {
            completion(nil, nil, buildRequest.1)
        }
    }
}
