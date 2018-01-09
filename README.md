# GithubAPI

[![CI Status](http://img.shields.io/travis/serhii-londar/GithubAPI.svg?style=flat)](https://travis-ci.org/serhii-londar/GithubAPI)
[![Version](https://img.shields.io/cocoapods/v/GithubAPI.svg?style=flat)](http://cocoapods.org/pods/GithubAPI)
[![License](https://img.shields.io/cocoapods/l/GithubAPI.svg?style=flat)](http://cocoapods.org/pods/GithubAPI)
[![Platform](https://img.shields.io/cocoapods/p/GithubAPI.svg?style=flat)](http://cocoapods.org/pods/GithubAPI)

Swift implementation of Github REST api v3. Library support swift 4.0. Work is in progress. 

Currently supported: 

- [x] [Issues API](https://developer.github.com/v3/issues/).
- [x] [Activity API(Notification)](https://developer.github.com/v3/activity/notifications/).
- [x] [Repositories API](https://developer.github.com/v3/repos/).
- [x] [Search API](https://developer.github.com/v3/search/).
- [x] [User API](https://developer.github.com/v3/users/).

TODO:

- [ ] [Activity API (Events, Feeds, Starring, Watching)](https://developer.github.com/v3/activity/).
- [ ] [Organizations API](https://developer.github.com/v3/orgs/).
- [ ] [Projects API](https://developer.github.com/v3/projects/).
- [ ] [Pull Requests API](https://developer.github.com/v3/pulls/). 
- [ ] [Reactions API](https://developer.github.com/v3/reactions/).
- [ ] [Repositories API](https://developer.github.com/v3/repos/).
- [ ] [Users API (Emails, Followers, Public Keys, GPG Keys, Block Another User)](https://developer.github.com/v3/users/).
- [ ] Documentation.

## Example Usage

### Authentication

#### Basic Authentication

This lib support Basic Authentication with login/password:

```swift
let authentication = BasicAuthentication(username: "username", password: "password")
UserAPI(authentication: authentication).getUser { (response, error) in
	if let response = response {
		print(response)
	} else {
		print(error ?? "")
	}
}
```

#### OAuth2 Token (sent in a header)

If you generate personal access token or receive access token from OAuth2, you can use it with AccessTokenAuthentication:

```swift
let authentication = AccessTokenAuthentication(access_token: "token")
UserAPI(authentication: authentication).getUser(username: "serhii-londar") { (response, error) in
	if let response = response {
		print(response)
	} else {
		print(error ?? "")
	}
}
```

#### OAuth2 Token (sent as a parameter)

If you generate personal access token or receive access token from OAuth2, you can use it in next way:

```swift
let authentication = TokenAuthentication(token: "token")
UserAPI(authentication: authentication).getAllUsers(since: "1") { (reposne, error) in
	if let response = response {
		print(response)
	} else {
		print(error ?? "")
	}
}
```

### Issues API

#### Create Issue:

```swift
let issue = Issue(title: "New Issue")
IssuesAPI(authentication: AccessTokenAuthentication(access_token: "access_token")).createIssue(owner: "owner", repository: "repository", issue: issue) { (response, error) in
	if let response = response {

	} else {
		print(error ?? "")
	}
}
```
#### Update Issue:

```swift
let issue = Issue(title: "Updated Issue")
        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "access_token")).updateIssue(owner: "owner", repository: "repository", number: number, issue: issue) { (response, error) in
	if let response = response {

	} else {
		print(error ?? "")
	}
}
```

### Repositories API

#### Get list of all repositories of user:

```swift
RepositoriesAPI(authentication: AccessTokenAuthentication(access_token: "access_token")).repositories(user: "user", type: .all) { (response, error) in
	if let response = response {

	} else {
		print(error ?? "")
	}
}
```

### Search API

#### Seart all repositories which contains qwer in name:

```swift
SearchAPI().searchRepositories(q: "qwer", page: 1, per_page: 100) { (response, error) in
	if let response = response {

	} else {
		print(error ?? "")
	}
}
```
        

## Example Application

To run the example project, clone the repo, and run `pod install` from the Example directory first. 

Example project contains example app with list of all user's github notification. 


<p align="center">
<img src="./Screenshots/main_screen.png" width="350"/>
</p>

## Requirements

* Xcode 9 or later
* iOS 9.0 or later
* macOS 10.12 or later
* Ubuntu 16.04 or later
* Swift 4.0 or later

## Installation

GithubAPI is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GithubAPI'
```

## Author

Serhii Londar, serhii.londar@gmail.com

## License

GithubAPI is available under the MIT license. See the LICENSE file for more info.



