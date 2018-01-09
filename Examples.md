
//        SearchAPI().searchRepositories(q: "macos app", page: 1, per_page: 1) { (response, error) in
//            if let totalCount = response?.totalCount {
//                self.repoCount = totalCount
//            }
//            if self.repoCount > 0 {
//                self.search()
//            }
//        }
//        RepositoriesAPI(authentication: AccessTokenAuthentication(access_token: "")).Repositories(user: "serhii-londar", type: .all) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        UserAPI(authentication: AccessTokenAuthentication(access_token: "")).getUser { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        UserAPI(authentication: AccessTokenAuthentication(access_token: "")).getUser(username: "serhii-londar") { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }
//        var user = UpdateUser()
//        user.name = "Serhii Londar"
//        user.hireable = false
//        UserAPI(authentication: AccessTokenAuthentication(access_token: "")).updateUser(user: user) { (user, error) in
//            if let user = user {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        UserAPI(authentication: AccessTokenAuthentication(access_token: "")).getAllUsers(since: "1") { (users, error) in
//            if let users = users {
//
//            } else {
//                print(error)
//            }
//        }

//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "")).getRepositoryIssues(owner: "serhii-londar", repository: "DocumenterXcode") { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "")).getIssue(owner: "serhii-londar", repository: "DocumenterXcode", number: 1) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        let issue = Issue(title: "Third1 Issue")
//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "")).createIssue(owner: "serhii-londar", repository: "GithubIssues", issue: issue) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }
//        IssuesAPI(authentication: AccessTokenAuthentication(access_token: "")).updateIssue(owner: "serhii-londar", repository: "GithubIssues", number: 3, issue: issue) { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

//        UserAPI(authentication: TokenAuthentication(token: "")).getUser { (response, error) in
//            if let response = response {
//
//            } else {
//                print(error ?? "")
//            }
//        }

