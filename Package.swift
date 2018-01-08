// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "GithubAPI",
    products: [
        .library(name: "GithubAPI", targets: ["GithubAPI"])
        ],
    dependencies: [
        .package(url: "https://github.com/serhii-londar/BaseAPI.git", from: "0.1.0"),
    ],
    targets: [
        .target(name: "GithubAPI", dependencies: ["BaseAPI"], path: "GithubAPI/Classes")
    ]
)
