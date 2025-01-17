// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "apns",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "APNS", targets: ["APNS"]),
    ],
    dependencies: [
        .package(name: "apnswift", url: "https://github.com/Lizonlin/APNSwift.git", from: "3.0.0"),
        .package(name: "vapor", url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    ],
    targets: [
        .target(name: "APNS", dependencies: [
            .product(name: "APNSwift", package: "apnswift"),
            .product(name: "Vapor", package: "vapor"),
        ]),
        .testTarget(name: "APNSTests", dependencies: [
            .target(name: "APNS"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
    ]
)
