// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SwiftTitanSDK",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SwiftTitanSDK",
            targets: ["SwiftTitanSDK"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", from: "600.0.0-latest"),
        .package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", .upToNextMajor(from: "0.5.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        // Macro implementation that performs the source transformation of a macro.
        .macro(
            name: "SwiftTitanSDKMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        // Library that exposes a macro as part of its API, which is used in client programs.
        .target(name: "SwiftTitanSDKHelper", dependencies: ["SwiftTitanSDKMacros"]),
        .target(name: "SwiftTitanSDK", dependencies: [
            "SwiftTitanSDKHelper",
            .product(name: "MemberwiseInit", package: "swift-memberwise-init-macro"),
        ]),

        // A client of the library, which is able to use the macro in its own code.
        .executableTarget(name: "SwiftTitanSDKClient", dependencies: ["SwiftTitanSDK"]),

        // A test target used to develop the macro implementation.
        .testTarget(
            name: "SwiftTitanSDKTests",
            dependencies: [
                "SwiftTitanSDK",
            ]
        ),
    ]
)
