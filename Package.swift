// swift-tools-version: 5.9

//
//  Package.swift
//  AIModule
//
//  Created by jch on 6/26/25.
//

import PackageDescription

let package = Package(
    name: "AIModule",
    platforms: [
        .iOS(.v16),
        .macOS(.v14)
    ],
    products: [
        .library(name: "AIModule", targets: ["AIModule"])
    ],
    dependencies: [
        .package(path: "../CoreModule")
    ],
    targets: [
        .target(
            name: "AIModule",
            dependencies: [
                .product(name: "CoreDatabase", package: "CoreModule"),
                .product(name: "CoreNetwork", package: "CoreModule")
            ],
            path: "Sources/AIModule"
        ),
        .testTarget(
            name: "AIModuleTests",
            dependencies: ["AIModule"],
            path: "Tests/AIModuleTests"
        )
    ]
)
