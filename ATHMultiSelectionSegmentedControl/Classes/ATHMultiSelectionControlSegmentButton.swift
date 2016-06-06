//
//  ATHMultiSelectionControlSegmentButton.swift
//  Pods
//
//  Created by Athanasios Theodoridis on 06/06/16.
//
//

import Foundation
import UIKit

internal class ATHMultiSelectionControlSegmentButton: UIButton {
    
    // MARK: - Private Properties
    private var _isButtonSelected: Bool = false
    
    // MARL: - Public Properties
    public var isButtonSelected: Bool {
        return _isButtonSelected
    }
    
    // MARK: - Initialisers
    public init() {
        
        super.init(frame: CGRectZero)
        _configureButton()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func _configureButton() {

        backgroundColor = UIColor.clearColor()
        
        setTitleColor(tintColor, forState: .Normal)
        
        layer.borderWidth = 0.5
        layer.borderColor = tintColor.CGColor
        
        showsTouchWhenHighlighted = true

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
    public func setButtonSelected(isSelected: Bool) {
        
        _isButtonSelected = isSelected
        _isButtonSelected ? _setSelectedState() : _setUnselectedState()
        
    }
}