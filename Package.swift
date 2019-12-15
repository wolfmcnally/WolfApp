// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "WolfApp",
    platforms: [
        .iOS(.v9), .macOS(.v10_13), .tvOS(.v11)
    ],
    products: [
        .library(
            name: "WolfApp",
            type: .dynamic,
            targets: ["WolfApp"]),
        ],
    dependencies: [
        .package(url: "https://github.com/wolfmcnally/WolfConcurrency", from: "3.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfLocale", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfFoundation", from: "5.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfStrings", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/ExtensibleEnumeratedName", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfOSBridge", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfPipe", from: "2.0.0"),
        .package(url: "https://github.com/wolfmcnally/WolfLog", from: "2.0.0"),
    ],
    targets: [
        .target(
            name: "WolfApp",
            dependencies: [
                "WolfLocale",
                "WolfConcurrency",
                "WolfFoundation",
                "WolfStrings",
                "ExtensibleEnumeratedName",
                "WolfOSBridge",
                "WolfPipe",
                "WolfLog"
        ])
        ]
)
