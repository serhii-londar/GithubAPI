//
//  GithubAPI.swift
//  GithubAPI
//
//  Created by Serhii Londar on 1/2/18.
//  Copyright © 2018 Serhii Londar. All rights reserved.
//

import Foundation
import BaseAPI

#if swift(>=5.1) && os(Linux)
   import FoundationNetworking
#endif

public class GithubAPI: BaseAPI {
    var authentication: Authentication?
    
    var defaultHeaders = [
        "Accept" : "application/vnd.github.v3+json",
        RequestHeaderFields.acceptEncoding.rawValue : "gzip",
        "Content-Type" : "application/json; charset=utf-8"
    ]
    
    public init(authentication: Authentication? = nil) {
        self.authentication = authentication
        super.init()
    }
    
    public override init() {
        super.init()
    }
    
    let baseUrl = "https://api.github.com"
    
    public func gh_get<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, completion: @escaping (T?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.get(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders) { (data, _, error) in
            if let data = data {
                do {
                    let model = try GithubAPI.decoder.decode(T.self, from: data)
                    completion(model, error)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    public func gh_get(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.get(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, completion: completion)
    }
    
    public func gh_getSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil) -> (response: T?, error: Error?) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        let response = self.get(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders)
        if let data = response.data {
            do {
                let model = try GithubAPI.decoder.decode(T.self, from: data)
                return (model, response.error)
            } catch {
                return (nil, error)
            }
        } else {
            return (nil, response.error)
        }
    }
    
    public func gh_put<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (T?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.put(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body) { (data, _, error) in
            if let data = data {
                do {
                    let model = try GithubAPI.decoder.decode(T.self, from: data)
                    completion(model, error)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    public func gh_put(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.put(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body, completion: completion)
    }
    
    public func gh_putSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?) -> (response: T?, error: Error?) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        let response = self.put(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body)
        if let data = response.data {
            do {
                let model = try GithubAPI.decoder.decode(T.self, from: data)
                return (model, response.error)
            } catch {
                return (nil, error)
            }
        } else {
            return (nil, response.error)
        }
    }
    
    public func gh_post<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (T?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.post(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body) { (data, _, error) in
            if let data = data {
                do {
                    let model = try GithubAPI.decoder.decode(T.self, from: data)
                    completion(model, error)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    public func gh_post(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.post(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body, completion: completion)
    }
    
    public func gh_postSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?) -> (response: T?, error: Error?) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        let response = self.post(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body)
        if let data = response.data {
            do {
                let model = try GithubAPI.decoder.decode(T.self, from: data)
                return (model, response.error)
            } catch {
                return (nil, error)
            }
        } else {
            return (nil, response.error)
        }
    }
    
    public func gh_patch<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (T?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.patch(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body) { (data, _, error) in
            if let data = data {
                do {
                    let model = try GithubAPI.decoder.decode(T.self, from: data)
                    completion(model, nil)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    
    public func gh_patch(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.patch(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body, completion: completion)
    }
    
    public func gh_patchSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?) -> (response: T?, error: Error?) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        let response = self.patch(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body)
        if let data = response.data {
            do {
                let model = try GithubAPI.decoder.decode(T.self, from: data)
                return (model, response.error)
            } catch {
                return (nil, error)
            }
        } else {
            return (nil, response.error)
        }
    }
	
	public func delete<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (T?, Error?) -> Swift.Void) {
		let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
		self.patch(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body) { (data, _, error) in
			if let data = data {
				do {
					let model = try JSONDecoder().decode(T.self, from: data)
					let error = try JSONDecoder().decode(OtherUserError.self, from: data)
					completion(model, error)
				} catch {
					completion(nil, error)
				}
			} else {
				completion(nil, error)
			}
		}
	}
	
	public func deleteSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?) -> (response: T?, error: Error?) {
		let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
		let response = self.patch(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, body: body)
		if let data = response.data {
			do {
				let model = try JSONDecoder().decode(T.self, from: data)
				return (model, response.error)
			} catch {
				return (nil, error)
			}
		} else {
			return (nil, response.error)
		}
	}
    
    public func gh_delete<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (T?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.delete(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders) { (data, _, error) in
            if let data = data {
                do {
                    let model = try GithubAPI.decoder.decode(T.self, from: data)
                    completion(model, error)
                } catch {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    public func gh_delete(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        self.delete(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders, completion: completion)
    }
    
    public func gh_deleteSync<T:Decodable>(path: String, parameters: [String : String]? = nil, headers: [String: String]? = nil, body: Data?) -> (response: T?, error: Error?) {
        let (newHeaders, newParameters) = self.addAuthenticationIfNeeded(headers, parameters: parameters)
        let response = self.delete(url: self.baseUrl + path, parameters: newParameters, headers: newHeaders)
        if let data = response.data {
            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                return (model, response.error)
            } catch {
                return (nil, error)
            }
        } else {
            return (nil, response.error)
        }
    }
    
    func addAuthenticationIfNeeded(_ headers: [String : String]?, parameters: [String : String]?) -> (headers: [String : String]?, parameters: [String : String]?) {
        var newHeaders = headers
        var newParameters = parameters
        if let authentication = self.authentication {
            if authentication.type == .headers {
                if var newHeaders = newHeaders {
                    newHeaders[authentication.key] = authentication.value
                    return (newHeaders, newParameters)
                } else {
                    newHeaders = [String : String]()
                    newHeaders![authentication.key] = authentication.value
                    return (newHeaders, newParameters)
                }
            } else if authentication.type == .parameters {
                if var newParameters = newParameters {
                    newParameters[authentication.key] = authentication.value
                    return (newHeaders, newParameters)
                } else {
                    newParameters = [String : String]()
                    newParameters![authentication.key] = authentication.value
                    return (newHeaders, newParameters)
                }
            }
        }
        return (newHeaders, newParameters)
    }
    
    func addDefaultHeaders(_ headers: [String : String]?) -> [String : String]? {
        var newHeaders = headers
        if newHeaders == nil {
            newHeaders = [String : String]()
        }
        for header in defaultHeaders {
            newHeaders![header.key] = header.value
        }
        return newHeaders
    }
    
}


extension GithubAPI {
    public static var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
            if let date = formatter.date(from: dateStr) {
                return date
            }
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
            if let date = formatter.date(from: dateStr) {
                return date
            }
            throw DecodingError.typeMismatch(Date.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not decode date"))
        })
        return decoder
    }
    
    public static var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        encoder.dateEncodingStrategy = .formatted(formatter)
        return encoder
    }
}
