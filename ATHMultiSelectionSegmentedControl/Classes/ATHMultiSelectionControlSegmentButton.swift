//
//  ATHMultiSelectionControlSegmentButton.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 06/06/16.
//
//

import Foundation
import UIKit

import QuartzCore

internal class ATHMultiSelectionControlSegmentButton: UIButton {
    
    // MARK: - Private Properties
    private var _isButtonSelected: Bool = false
    private var _isButtonEnabled: Bool = true
    
    // MARK: - Public Properties
    /// Whether the button is currently in a selected state
    internal var isButtonSelected: Bool {
        return _isButtonSelected
    }
    /// Whether the button
    internal var isButtonEnabled: Bool {
        return _isButtonEnabled
    }
    
    override var highlighted: Bool {
       
        didSet {
        
            // ignore highlighting if button is disabled
            if !_isButtonEnabled { return }
            
            if highlighted {
                backgroundColor = tintColor.colorWithAlphaComponent(0.1)
            } else {
            
                if _isButtonSelected {
                    backgroundColor = tintColor
                } else {
                    backgroundColor = UIColor.clearColor()
                }
            
            }
        
        }
    }
    
    // MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        _configureButton()
    }
       
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    /**
     Configures the initial style of the button
     - Sets title color
     - Clears background color
     - Adds a border of 0.5 px
    */
    private func _configureButton() {

        setTitleColor(tintColor, forState: .Normal)
        
        backgroundColor = UIColor.clearColor()
        
        layer.borderWidth = 0.5
        layer.borderColor = tintColor.CGColor
        
    }
    
    /**
     Styles the button as selected
    */
    private func _setSelectedState() {
        
        backgroundColor = tintColor
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
    /**
     Styles the button as deselected
    */
    private func _setDeselectedState() {
        
        backgroundColor = UIColor.clearColor()        
        setTitleColor(tintColor, forState: .Normal)
        
    }
    
    // MARK: - Public Methods
    /**
     Toggles the receiver's selection state and styles it appropriately
    */
    internal func setButtonSelected(isSelected: Bool) {
        
        _isButtonSelected = isSelected
        _isButtonSelected ? _setSelectedState() : _setDeselectedState()
        
    }
    
    /**
     Toggles the receiver's enabled/disabled state and styles it appropriately
    */
    internal func setButtonEnabled(isEnabled: Bool) {

        if isEnabled {
            _setDeselectedState()
        } else {
            setTitleColor(UIColor.grayColor(), forState: .Normal)
            backgroundColor = UIColor.clearColor()
        }
        
        _isButtonEnabled = isEnabled
        
    }
    
}