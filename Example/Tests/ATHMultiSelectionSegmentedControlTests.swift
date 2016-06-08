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
        
        expect(self.segmentedControl.selectedSegmentIndices.count) == 2

    }
    
    func testTitleForSegmentAtIndexMethodWithInvalidIndex() {
        
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()

        expect(self.segmentedControl.titleForSegmentAtIndex(-1)).to(beNil())
        
    }
    
    func testTitleForSegmentAtIndexMethod() {
        
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()
        
        expect(self.segmentedControl.titleForSegmentAtIndex(0)) == "1"
        expect(self.segmentedControl.titleForSegmentAtIndex(1)) == "2"
        expect(self.segmentedControl.titleForSegmentAtIndex(2)) == "3"
        expect(self.segmentedControl.titleForSegmentAtIndex(3)) == "4"
        expect(self.segmentedControl.titleForSegmentAtIndex(100)) == "4"
    
    }
    
    func testSetTitleForSegmentAtIndexMethod() {
        
        segmentedControl.insertSegmentsWithTitles(["1", "2", "3", "4"])
        segmentedControl.layoutSubviews()

        segmentedControl.setTitle("one", forSegmentAtIndex: 0)
        segmentedControl.setTitle("two", forSegmentAtIndex: 1)
        segmentedControl.setTitle("three", forSegmentAtIndex: 2)
        segmentedControl.setTitle("four", forSegmentAtIndex: 3)
        
        expect(self.segmentedControl.titleForSegmentAtIndex(0)) == "one"
        expect(self.segmentedControl.titleForSegmentAtIndex(1)) == "two"
        expect(self.segmentedControl.titleForSegmentAtIndex(2)) == "three"
        expect(self.segmentedControl.titleForSegmentAtIndex(3)) == "four"
        
        segmentedControl.setTitle("five", forSegmentAtIndex: 100)
        expect(self.segmentedControl.titleForSegmentAtIndex(3)) == "five"
        
    }
    
    func testInsertSegmentAtIndexMethodWithNegativeIndex() {
        
        segmentedControl.insertSegmentWithTitle("blah", atIndex: -1, animated: true)
        
        expect(self.segmentedControl.numberOfSegments) == 0
        
    }
    
    func testInsertSegmentAtIndexMethod() {
        
        segmentedControl.insertSegmentWithTitle("one", atIndex: 0, animated: true)

        expect(self.segmentedControl.numberOfSegments) == 1
        expect(self.segmentedControl.titleForSegmentAtIndex(0)) == "one"
        
        segmentedControl.insertSegmentWithTitle("two", atIndex: 0, animated: true)
        expect(self.segmentedControl.numberOfSegments) == 2
        expect(self.segmentedControl.titleForSegmentAtIndex(0)) == "two"
        
        segmentedControl.insertSegmentWithTitle("three", atIndex: 1, animated: true)
        expect(self.segmentedControl.numberOfSegments) == 3
        expect(self.segmentedControl.titleForSegmentAtIndex(0)) == "two"
        expect(self.segmentedControl.titleForSegmentAtIndex(1)) == "three"
        expect(self.segmentedControl.titleForSegmentAtIndex(2)) == "one"
        
    }
}
