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
            url: "https://github.com/getlipa/lipa-business-lib-swift/releases/download/v0.1.0-alpha.12/lipabusinesslibFFI.xcframework.zip",
            checksum: "0c4097976caf12c13aa756873ccf048c61a9c2035eebabcbd062c9d712607c17"),
            .target(
                    name: "LipaBusinessLib",
                    dependencies: ["lipabusinesslibFFI"]),
        ]
)