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
    
    // MARL: - Public Properties
    internal var isButtonSelected: Bool {
        return _isButtonSelected
    }
    
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
    private func _configureButton() {

        setTitleColor(tintColor, forState: .Normal)
        
        backgroundColor = UIColor.clearColor()
        
        layer.borderWidth = 0.5
        layer.borderColor = tintColor.CGColor
        
    }
    
    
    private func _setSelectedState() {
        
        backgroundColor = tintColor
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
    private func _setUnselectedState() {
        
        backgroundColor = UIColor.clearColor()        
        setTitleColor(tintColor, forState: .Normal)
        
    }
    
    // MARK: - Public Methods
    internal func setButtonSelected(isSelected: Bool) {
        
        _isButtonSelected = isSelected
        _isButtonSelected ? _setSelectedState() : _setUnselectedState()
        
    }
    
    internal func setButtonEnabled(isEnabled: Bool) {

        if isEnabled {
            _setUnselectedState()
        } else {
            setTitleColor(UIColor.grayColor(), forState: .Normal)
            backgroundColor = UIColor.clearColor()
        }
        
        _isButtonEnabled = isEnabled
        
    }
    
}