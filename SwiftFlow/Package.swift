// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-flow",
    products: [
        .library(name: "SwiftFlow", targets: ["SwiftFlow"]),
    ],
    targets: [
        .target(name: "SwiftFlow"),
        .testTarget(name: "SwiftFlowTests", dependencies: ["SwiftFlow"]),
    ]
)
