# ATHMultiSelectionSegmentedControl

[![CI Status](http://img.shields.io/travis/attheodo/ATHMultiSelectionSegmentedControl.svg?style=flat)](https://travis-ci.org/attheodo/ATHMultiSelectionSegmentedControl)
[![Version](https://img.shields.io/cocoapods/v/ATHMultiSelectionSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/ATHMultiSelectionSegmentedControl)
[![License](https://img.shields.io/cocoapods/l/ATHMultiSelectionSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/ATHMultiSelectionSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/ATHMultiSelectionSegmentedControl.svg?style=flat)](http://cocoapods.org/pods/ATHMultiSelectionSegmentedControl)
[![Language](https://img.shields.io/badge/language-Swift%203.0-orange.svg)](https://developer.apple.com/swift/)

[![Logo](misc/logo.png  "ATHExtensions")](/)

**ATHMultiSelectionSegmentedControl** is a `UIView` based control mimicking the API of `UISegmentedControl` but also allowing for multiple selection of segments. It's fully battle and unit-tested. If you find any bugs or want to suggest improvements please feel free to contribute.

[![Demo](misc/demo.gif "ATHMultiSelectionSegmentedControl")](/)

## Compatibility
* Use `swift2.2` branch for Swift 2.2
* Use `master` branch for Swift 3.0

## API
```swift
import ATHMultiSelectionSegmentedControl

// initialize empty segmented control
let segmentedControl = ATHMultiSelectionSegmentedControl()

// Add items to segmented control at once...
segmentedControl.insertSegmentsWithTitles(["Segment 1", "Segment 2", "Segment 3"])

// ... or one by one
segmentedControl.insertSegmentWithTitle("Segment 4", atIndex: 3, animated: true)

// Get and set items
segmentedControl.titleForSegmentAtIndex(0) // Segment 1
segmentControl.setTitle("Title", forSegmentAtIndex: 0)
segmentedControl.titleForSegmentAtIndex(0) // Title

// Enable or disable an option
segmentedControl.setEnabled(false, forSegmentAtIndex: 0) // "Title" segment is now disabled
segmentedControl.isEnabledForSegmentAtIndex(0) // false
segmentedControl.setEnabled(true, forSegmentAtIndex: 0) // "Title" segment is now enabled
segmentedControl.isEnabledForSegmentAtIndex(0) // true 


```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ATHMultiSelectionSegmentedControl is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ATHMultiSelectionSegmentedControl"
```

## Author

attheodo, at@atworks.gr

## License

ATHMultiSelectionSegmentedControl is available under the MIT license. See the LICENSE file for more info.

## Changelog
- **v0.2.0**, *September 2016*
    - Migration to Swift 3.0
- **v0.1.1**, *July 2016*
    - Bug fixes for tinting and button insertion
- **v0.1.0**, *May 2016*
    - Initial release
