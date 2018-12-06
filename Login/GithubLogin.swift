//
//  GithubLogin.swift
//  GithubAPI
//
//  Created by Serhii Londar on 12/4/18.
//

import Foundation
import SafariServices

public class GithubLogin: NSObject {
    public enum Scopes : String {
        case user = "user"
        case userEmail = "user:email"
        case userFollow = "user:follow"
        case publicRepo = "public_repo"
        case repo = "repo"
        case repoDeployment = "repo_deployment"
        case repoStatus = "repo:status"
        case deleteRepo = "delete_repo"
        case notifications = "notifications"
        case gist = "gist"
        case readRepoHook = "read:repo_hook"
        case writeRepoHook = "write:repo_hook"
        case adminRepoHook = "admin:repo_hook"
        case adminOrgHook = "admin:org_hook"
        case readOrg = "read:org"
        case writeOrg = "write:org"
        case adminOrg = "admin:org"
        case readPublicKey = "read:public_key"
        case writePublicKey = "write:public_key"
        case adminPublicKey = "admin:public_key"
        case readGPGKey = "read:gpg_key"
        case writeGPGKey = "write:gpg_key"
        case adminGPGKey = "admin:gpg_key"
    }
    private var completionBlock : ((String?, Error?) -> Void)!
    private var urlScheme : String
    private var clientSecret : String
    private let clientID : String
    private var safariViewController : SFSafariViewController?
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.completionBlock(nil, nil)
    }
    
    init(clientID: String, clientSecret: String, urlScheme: String) {
        super.init()
        self.clientID = clientID
        self.urlScheme = urlScheme
        self.clientSecret = clientSecret
    }
    
    public func handle(applicationURL url : URL) {
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        print(url)
        if (components.scheme! + "://") == urlScheme {
            self.safariViewController?.dismiss(animated: true, completion: nil)
            guard let queryItems = components.queryItems else {
                self.completionBlock(nil, nil)
                return
            }
            guard let baseURL = URL(string : "https://github.com/login/oauth/access_token") else {
                return
            }
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: baseURL)
            var queryDictionary = [String : Any]()
            for item in queryItems { queryDictionary[item.name] = item.value }
            if let errorName = queryDictionary["error"] as? String, let errorDescription = queryDictionary["error_description"] as? String, let errorURI = queryDictionary["error_uri"] as? String {
                self.completionBlock(nil, nil)
                return
            }
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            let code = queryDictionary["code"] as! String
            request.httpBody = "client_id=\(self.clientID)&client_secret=\(self.clientSecret)&code=\(code)&redirect_uri=\(self.urlScheme)".data(using: .ascii)
            let task = session.dataTask(with: request) { [unowned self] (data, response, error) in
                if error != nil {
                    self.completionBlock(nil, error)
                } else if let data = data {
                    let responseDictionary = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String : Any]
                    guard responseDictionary != nil, let accessToken = responseDictionary?["access_token"] as? String else {
                        self.completionBlock(nil, nil)
                        return
                    }
                    self.completionBlock(accessToken, nil)
                }
            }
            task.resume()
        }
    }
    
    private func buildURL(with scopes : [Scopes], allowSignup: Bool) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "github.com"
        urlComponents.path = "/login/oauth/authorize"
        let scopeStrings = scopes.map { $0.rawValue }
        let scopesQueryItem = URLQueryItem(name: "scope", value: scopeStrings.joined(separator: " "))
        let redirectURIQueryItem = URLQueryItem(name: "redirect_uri", value: "\(urlScheme)")
        let allowSignupQueryItem = URLQueryItem(name: "allow_signup", value: "\(allowSignup ? "true" : "false")")
        let clientIDQueryItem = URLQueryItem(name: "client_id", value: clientID)
        urlComponents.queryItems = [scopesQueryItem, redirectURIQueryItem, allowSignupQueryItem, clientIDQueryItem]
        return urlComponents.url!
    }
    
    public func login(withScopes scopes : [Scopes], allowSignup: Bool, presenter : UIViewController, completion : @escaping (String?, Error?) -> Void) {
        self.completionBlock = completion
        let url = self.buildURL(with: scopes, allowSignup: allowSignup)
        self.safariViewController = SFSafariViewController(url: url)
        self.safariViewController?.delegate = self
        presenter.present(self.safariViewController!, animated: true, completion: nil)
    }
}

extension GithubLogin: SFSafariViewControllerDelegate {
    
}
