//
//  ATHMultiSelectionSegmentedControl.swift
//  ATHMultiSelectionSegmentedControl
//
//  Created by Athanasios Theodoridis on 06/06/16.
//
//

import Foundation
import UIKit

/**
 MultiSelectionSegmentedControlDelegate delegate protocol.
*/
public protocol MultiSelectionSegmentedControlDelegate: class {
    /// Gets called *ONLY* if the user interacts with the control and not
    /// when the control is configured programatically
    func multiSelectionSegmentedControl(_ control: MultiSelectionSegmentedControl, selectedIndices indices: [Int])
}

open class MultiSelectionSegmentedControl: UIView {
    
    // MARK: - Private Properties
    fileprivate var _segmentButtons: [ATHMultiSelectionControlSegmentButton]?
    fileprivate var _items: [String]?
    
    // MARK: - Public Properties
    open weak var delegate: MultiSelectionSegmentedControlDelegate?
    
    open var cornerRadius: CGFloat = 3 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    open var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override open var tintColor: UIColor! {
        didSet {
            layer.borderColor = tintColor.cgColor
            if let segmentButtons = _segmentButtons {
                for (index, button) in segmentButtons.enumerated() {
                    button.isHighlighted = selectedSegmentIndices.contains(index)
                }
            }
        }
    }

    open override var backgroundColor: UIColor? {
        didSet {
            if let segmentButtons = _segmentButtons {
                for (index, button) in segmentButtons.enumerated() {
                    button.isHighlighted = selectedSegmentIndices.contains(index)
                }
            }
        }
    }
    
    /// Returns the number of segments the receiver has. (read-only)
    open var numberOfSegments: Int {
        
        guard let segments = _segmentButtons , segments.count > 0 else {
            return 0
        }
        
        return segments.count
    }
    
    /**
     An array with the currently selected segment indices of the receiver.
    */
    open var selectedSegmentIndices: [Int] {
        
        get {

            guard let segments = _segmentButtons , segments.count > 0 else {
                return []
            }
            
            var indices: [Int] = []
            
            for (index, segmentButton) in segments.enumerated() {
                if segmentButton.isButtonSelected && segmentButton.isButtonEnabled {
                    indices.append(index)
                }
            }
            
            return indices

        }
        
        set {
            
            guard let segments = _segmentButtons , segments.count > 0 else {
                return
            }
            
            _deselectAllSegments()

            for index in newValue {
                if segments[index].isButtonEnabled {
                    segments[index].setButtonSelected(true)
                }
            }
            
        }
        
    }
   
    // MARK: - Initialisers
    
    /**
     Initialises and returns a multiple-selection segmented control having the given titles.
     
     - parameter items: An array of `String` objects with the segments titles
     - returns: An initialised `MultiSelectionSegmentedControl` object
    */
    public init(items: [String]?) {
        
        _items = items
        
        super.init(frame: CGRect.zero)
        _configureAppearance()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        _configureAppearance()
    }
    
    // MARK: - Public Methods
    override open func layoutSubviews() {

        guard let items = _items , items.count > 0 else {
            return
        }
        
        if subviews.count == 0 {

            _segmentButtons = []


            let buttonWidth = frame.width / CGFloat(items.count)
            let buttonHeight = frame.height

            for (index, segmentTitle) in items.enumerated() {
                let buttonFrame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)

                let button = ATHMultiSelectionControlSegmentButton(frame: buttonFrame)

                button.tintColor = tintColor
                button.backgroundColor = backgroundColor
                button.setButtonSelected(selectedSegmentIndices.contains(index))
                button.addTarget(self, action: #selector(self._didTouchUpInsideSegment(_:)), for: .touchUpInside)

                button.setTitle(segmentTitle, for: .normal)

                _segmentButtons?.append(button)
                
                self.addSubview(button)
                
            }
            
        }
        else {
            if let segmentButtons = _segmentButtons {
                let buttonWidth = frame.width / CGFloat(segmentButtons.count)
                let buttonHeight = frame.height

                for (index, button) in segmentButtons.enumerated() {
                    let buttonFrame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
                    button.frame = buttonFrame
                    button.setButtonSelected(selectedSegmentIndices.contains(index))
                }
            }
        }
    
    }
    
    // MARK: Managing Segment Content
    /**
     Sets the title of a segment.
     
     - parameter title: A string to display in the segments as its title.
     - parameter segment: An index number identifying a segment in the control. 
     It must be a number between 0 and the number of segments (numberOfSegments) minus 1; values exceeding this upper range are pinned to it.
    */
    open func setTitle(_ title: String, forSegmentAtIndex segment: Int) {
        
        guard let segments = _segmentButtons , segments.count > 0 && segment >= 0 else {
            return
        }
        
        let index = segment > segments.count - 1 ? segments.count - 1 : segment
        
        segments[index].setTitle(title, for: .normal)
        
    }
    
    /**
     Returns the title of the specified segment.
     
     - parameter segment: An index number identifying a segment in the control. It must be a number between 0 and the number of segments (numberOfSegments) 
     minus 1; values exceeding this upper range are pinned to it.
     - returns: Returns the string (title) assigned to the receiver as content.
    */
    open func titleForSegmentAtIndex(_ segment: Int) -> String? {
       
        guard let segments = _segmentButtons , segments.count > 0 && segment >= 0 else {
            return nil
        }
        
        let index = segment > segments.count - 1 ? segments.count - 1 : segment
        
        return segments[index].titleLabel?.text
        
    }
    
    // MARK: Managing Segment Behavior
    
    /**
     Enables the specified segment.
     
     - parameter enabled: `true` to enable the specified segment or `false` to disable the segment.
     By default all segments are enabled
    */
    open func setEnabled(_ enabled: Bool, forSegmentAtIndex segment: Int) {

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) { () -> Void in

            guard let segments = self._segmentButtons , segments.count > 0 && segment >= 0 else {
                return
            }

            let index = segment > segments.count - 1 ? segments.count - 1 : segment
            segments[index].setButtonEnabled(enabled)

        }
        
    }
    
    /**
     Returns whether the indicated segment is enabled.
     
     - parameter segment: An index number identifying a segment in the control. It must be a number between 0 and the number of segments (numberOfSegments) minus 1; 
     values exceeding this upper range are pinned to it.
     
     - returns: `true` if the given segment is enabled and `false` if the segment is disabled. By default, segments are enabled.
    */
    open func isEnabledForSegmentAtIndex(_ segment: Int) -> Bool {

        guard let segments = _segmentButtons , segments.count > 0 && segment >= 0 else {
            return false
        }
        
        let index = segment > segments.count - 1 ? segments.count - 1 : segment
        
        return segments[index].isButtonEnabled

    }
    
    // MARK: Managing Segments
    /**
     Creates a number of segments based on the passed array of titles
     
     - parameter titles: The titles of the segments to create.
    */
    open func insertSegmentsWithTitles(_ titles: [String]) {
        
        _items = titles
        _configureAppearance()
        
        setNeedsLayout()
    
    }
    
    /**
     Inserts a segment at a specific position in the receiver and gives it a title as content.
     
     - parameter title: A string to use as the segment’s title.
     - parameter segment: An index number identifying a segment in the control. The new segment is inserted just before the designated one.
     - parameter animated: true if the insertion of the new segment should be animated, otherwise false.
    */
    open func insertSegmentWithTitle(_ title: String, atIndex segment: Int, animated: Bool) {
        
        guard segment >= 0 else {
            return
        }
        
        if numberOfSegments == 0 {
            _configureAppearance()
        }
        
        let index = segment
        
        if _items == nil { _items = [] }
        if _segmentButtons == nil { _segmentButtons = [] }

        if index > _items!.count {
            _items!.append(title)
        } else {
            _items!.insert(title, at: index)
        }
        
        let button = ATHMultiSelectionControlSegmentButton(frame: CGRect(x: self.frame.width, y: 0, width: 0, height: self.frame.height))
       
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.addTarget(self, action: #selector(self._didTouchUpInsideSegment(_:)), for: .touchUpInside)
        
        button.setTitle(title, for: .normal)
        
        addSubview(button)
        
        if index > _segmentButtons!.count {
            _segmentButtons?.append(button)
        } else {
            _segmentButtons!.insert(button, at: index)
        }
        
        let duration = animated ? 0.35 : 0

        UIView.animate(withDuration: duration, animations: {

            for (index, segment) in self._segmentButtons!.enumerated() {
                
                let buttonWidth = self.frame.width / CGFloat(self._items!.count)
                let buttonHeight = self.frame.height
                
                let buttonFrame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
                segment.frame = buttonFrame
                
            }

        }) 
        
    }
    
    /**
     Removes the specified segment from the receiver, optionally animating the transition.
     
     - parameter segment: An index number identifying a segment in the control. It must be a number between 0 and the number of segments (numberOfSegments) minus 1; 
     values exceeding this upper range are pinned to it.
     - parameter animated: `true` if the removal of the new segment should be animated, otherwise `false`.
    */
    open func removeSegmentAtIndex(_ segment: Int, animated: Bool) {
       
        guard var segments = _segmentButtons , segments.count > 0 && segment >= 0 else {
            return
        }
        
        // if segment is out of range pin it
        let index = segment > segments.count - 1 ? segments.count - 1 : segment
        
        _items!.remove(at: index)
        
        segments[index].removeFromSuperview()
        segments.remove(at: index)
        _segmentButtons!.remove(at: index)
        
        let duration = animated ? 0.35 : 0
        
        UIView.animate(withDuration: duration, animations: {
            for (index, _) in segments.enumerated() {
               
                let buttonWidth = self.frame.width / CGFloat(segments.count)
                let buttonHeight = self.frame.height
                
                segments[index].frame = CGRect(x: CGFloat(index)*buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
            
            }
        }) 
        
        if segments.count == 0 {
            layer.borderWidth = 0
        }

    }
    
    /**
     Removes all segments of the receiver.
    */
    open func removeAllSegments() {
       
        layer.borderWidth = 0

        _segmentButtons?.forEach { segment in
            segment.removeFromSuperview()
        }
        _segmentButtons?.removeAll()
        _items?.removeAll()
    
    }
    
    // MARK: - Private Methods
    /**
     Configures the control's appearance:
     - Clears background color
     - Sets corner radius
     - Sets border width and color
    */
    fileprivate func _configureAppearance() {
        
//        backgroundColor = UIColor.clearColor()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = tintColor.cgColor
    
    }
    
    /**
     Selector to the control's segment buttons. Handles selecting/deselecting segments
     according to whether they are enabled or not.
    */
    @objc fileprivate func _didTouchUpInsideSegment(_ segmentButton: ATHMultiSelectionControlSegmentButton) {
        
        guard let segmentButtons = _segmentButtons , segmentButtons.count > 0 else {
            return
        }
        
        guard segmentButton.isButtonEnabled else {
            return
        }
        
        if segmentButton.isButtonSelected {
            segmentButton.setButtonSelected(false)
        } else {
            segmentButton.setButtonSelected(true)
        }
        
        delegate?.multiSelectionSegmentedControl(self, selectedIndices: selectedSegmentIndices)
        
    }
    
    /**
     Deselects all segments of the segmented control
    */
    fileprivate func _deselectAllSegments() {
        
        guard let segments = _segmentButtons , segments.count > 0 else {
            return
        }
        
        segments.forEach { segment in
            segment.setButtonSelected(false)
        }
        
    }
}
