// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "BGOpaqueLabel",
    platforms: [.iOS(.v13)],
    products: [.library(name: "BGOpaqueLabel", targets: ["BGOpaqueLabel"])],
    targets: [.target(name: "BGOpaqueLabel", path: "Sources")]
)
