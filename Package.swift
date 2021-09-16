// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "ATHMultiSelectionSegmentedControl",
    products: [
        .library(name: "ATHMultiSelectionSegmentedControl", targets: ["ATHMultiSelectionSegmentedControl"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ATHMultiSelectionSegmentedControl",
            path: "./ATHMultiSelectionSegmentedControl"
        )
    ]
)