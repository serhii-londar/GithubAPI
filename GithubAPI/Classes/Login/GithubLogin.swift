//
//  GithubLogin.swift
//  GithubAPI
//
//  Created by Serhii Londar on 12/4/18.
//

import Foundation
#if os(iOS)
import UIKit
#endif

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

#if os(iOS)
public class GithubLoginVC: UIViewController {
    private var completion: ((String) -> Void)! = nil
    private var error: ((Error) -> Void)! = nil
    
    private var redirectURL: String
    private var clientSecret: String
    private let clientID: String
    
    private var window: UIWindow?
    private var webView: UIWebView! = nil {
        didSet {
            webView.delegate = self
        }
    }
    
    public init(clientID: String, clientSecret: String, redirectURL: String) {
        self.clientID = clientID
        self.redirectURL = redirectURL
        self.clientSecret = clientSecret
        super.init(nibName: nil, bundle: nil)
        self.loadViewIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        webView = UIWebView(frame: self.view.bounds)
        view.addSubview(webView)
    }
    
    func present() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: self)
        window?.makeKeyAndVisible()
    }
    
    @objc func dismiss() {
        self.window?.resignKey()
        self.window?.isHidden = true
        self.window = nil
    }
    
    private func buildURL(with scopes : [Scopes], allowSignup: Bool) -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "github.com"
        urlComponents.path = "/login/oauth/authorize"
        let scopeStrings = scopes.map { $0.rawValue }
        let scopesQueryItem = URLQueryItem(name: "scope", value: scopeStrings.joined(separator: " "))
        let redirectURIQueryItem = URLQueryItem(name: "redirect_uri", value: "\(redirectURL)")
        let allowSignupQueryItem = URLQueryItem(name: "allow_signup", value: "\(allowSignup ? "true" : "false")")
        let clientIDQueryItem = URLQueryItem(name: "client_id", value: clientID)
        urlComponents.queryItems = [scopesQueryItem, redirectURIQueryItem, allowSignupQueryItem, clientIDQueryItem]
        return urlComponents.url!
    }
    
    public func login(withScopes scopes: [Scopes], allowSignup: Bool, completion: @escaping (String) -> Void, error: @escaping (Error) -> Void) {
        self.completion = completion
        self.error = error
        let url = self.buildURL(with: scopes, allowSignup: allowSignup)
        self.webView.loadRequest(URLRequest(url: url))
        self.present()
    }
}

extension GithubLoginVC: UIWebViewDelegate {
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.error?(error)
        self.dismiss()
    }
    
    public func webViewDidFinishLoad(_ webView: UIWebView) {
        guard let request = webView.request else { return }
        guard let urlString = request.url?.absoluteString else { return }
        guard let urlComponents = URLComponents(string: urlString) else { return }
        
        guard let host = urlComponents.host, let scheme = urlComponents.scheme else { return }
        
        let path = urlComponents.path
        let url = scheme + "://" + host + path
        guard url == self.redirectURL else { return }
        
        guard let queryItem = urlComponents.queryItems?.first(where: { $0.name == "code" }) else { return }
        
        guard let code = queryItem.value else { return }
        
        GithubLoginAPI().getAccessToken(clientID: clientID, clientSecret: clientSecret, code: code, redirectURL: redirectURL) { [weak self] (response, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let response = response {
                    self.completion(response.accessToken)
                } else {
                    self.error(error ?? NSError(domain: "Unknown error", code: 9999, userInfo: nil))
                }
                self.dismiss()
            }
        }
    }
}
#endif
