// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "WolfApp",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfApp",
            targets: ["WolfApp"]),
        ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfCore", from: "5.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfLocale", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "WolfApp",
            dependencies: ["WolfLocale", "WolfCore"])
        ]
)
