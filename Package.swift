// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "MySocialMedia",
    platforms: [
        .iOS(.v15) // This line forces SPM to understand SwiftUI availability requirements
    ],
    products: [
        .executable(name: "MySocialMedia", targets: ["MySocialMedia"])
    ],
    targets: [
        .executableTarget(
            name: "MySocialMedia",
            dependencies: [],
            path: "Sources"
        )
    ]
)
