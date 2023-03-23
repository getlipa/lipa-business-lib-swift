// swift-tools-version:5.3

import PackageDescription
import Foundation

let package = Package(
        name: "LipaBusinessLib",
        platforms: [
            .iOS(.v13)
        ],
        products: [
            .library(
                name: "LipaBusinessLib",
                targets: ["LipaBusinessLib"]),
        ],
        targets: [
            .binaryTarget(
            name: "lipabusinesslibFFI",
            url: "https://github.com/getlipa/lipa-business-lib-swift/releases/download/v0.2.0/lipabusinesslibFFI.xcframework.zip",
            checksum: "f812c81af0e2e82514c5ce81fa1c9e9f879ce737e44263c9cbd98224bb6689bb"),
            .target(
                    name: "LipaBusinessLib",
                    dependencies: ["lipabusinesslibFFI"]),
        ]
)