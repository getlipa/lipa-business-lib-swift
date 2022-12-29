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
            url: "https://github.com/getlipa/lipa-business-lib-swift/releases/download/v0.1.0-alpha.10/lipabusinesslibFFI.xcframework.zip",
            checksum: "c6b9befaba177d45090ff61cc85a4e50f3f2dfc6804830a726e3cb3ff607defe"),
            .target(
                    name: "LipaBusinessLib",
                    dependencies: ["lipabusinesslibFFI"]),
        ]
)