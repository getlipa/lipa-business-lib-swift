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
            url: "https://github.com/getlipa/lipa-business-lib-swift/releases/download/v0.1.0-alpha.19.badger2/lipabusinesslibFFI.xcframework.zip",
            checksum: "7361137b1418ae78227c3ad57c9806a89482c7532df3e37cbe11eba142390ad9"),
            .target(
                    name: "LipaBusinessLib",
                    dependencies: ["lipabusinesslibFFI"]),
        ]
)