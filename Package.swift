// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlideOutMenu",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SlideOutMenu",
            targets: ["SlideOutMenu"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SlideOutMenu",
            dependencies: [])
    ]
)
