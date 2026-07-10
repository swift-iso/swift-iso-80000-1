// swift-tools-version: 6.3.3

import PackageDescription

// ISO 80000-1: Quantities and units — Part 1: General (the SI prefixes)
let package = Package(
    name: "swift-iso-80000-1",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(name: "ISO 80000-1", targets: ["ISO 80000-1"])
    ],
    targets: [
        .target(name: "ISO 80000-1"),
        .testTarget(
            name: "ISO 80000-1 Tests",
            dependencies: ["ISO 80000-1"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
