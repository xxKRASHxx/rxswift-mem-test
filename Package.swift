// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MemoryTest",
    products: [
        .executable(name: "MemoryTest", targets: ["MemoryTest"])
    ],
    dependencies: [
        .package(url: "https://github.com/ReSwift/ReSwift", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "MemoryTest",
            dependencies: ["ReSwift"]
        ),
    ]
)
