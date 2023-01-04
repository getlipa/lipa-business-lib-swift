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
            url: "https://github.com/getlipa/lipa-business-lib-swift/releases/download/v0.1.0-alpha.11/lipabusinesslibFFI.xcframework.zip",
            checksum: "849da374a9528cb0a2d1b820d2b0348011e4ce57243489d5b11eda743626340b"),
            .target(
                    name: "LipaBusinessLib",
                    dependencies: ["lipabusinesslibFFI"]),
        ]
)