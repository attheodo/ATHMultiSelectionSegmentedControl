import UIKit
import XCTest

import ATHMultiSelectionSegmentedControl
import Nimble


class ATHMultiSelectionSegmentedControlTests: XCTestCase {
    
    var segmentedControl: MultiSelectionSegmentedControl!
    
    override func setUp() {
        
        super.setUp()
        segmentedControl = MultiSelectionSegmentedControl(items: nil)
    
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNumberOfSegmentsPropertyWithNoItems() {
        expect(self.segmentedControl.numberOfSegments) == 0
    }
    
    func testNumberOfSegmentsPropertyWithItems() {
    
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()
        
        expect(self.segmentedControl.numberOfSegments) == 4
    
    }
    
    func testSelectedSegmentIndicesPropertyWithNoItems() {
        expect(self.segmentedControl.selectedSegmentIndices.count) == 0
    }
    
    func testSelectedSegmentIndicesPropertyWithItemsButNoSelection() {
        
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()
        
        expect(self.segmentedControl.selectedSegmentIndices.count) == 0

    }
    
    func testSelectedSegmentIndicesPropertyWithItemsAndSelection() {
        
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()
        
        segmentedControl.selectedSegmentIndices = [0, 1]

    }
}
