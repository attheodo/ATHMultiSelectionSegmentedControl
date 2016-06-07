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
    private var _border: CALayer!
    
    // MARL: - Public Properties
    public var isButtonSelected: Bool {
        return _isButtonSelected
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
        
        showsTouchWhenHighlighted = true
        backgroundColor = UIColor.clearColor()
        
        _border = CALayer()
        _border.frame = CGRectMake(self.frame.size.width - 1 , 0, 1.0, self.frame.size.height)
        _border.backgroundColor = tintColor.CGColor
        
        self.layer.addSublayer(_border)
        
    }
    
    private func _setSelectedState() {
        
        backgroundColor = tintColor
        _border.backgroundColor = superview?.superview?.backgroundColor?.CGColor
        
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
    private func _setUnselectedState() {
        
        backgroundColor = UIColor.clearColor()
        _border.backgroundColor = tintColor.CGColor
        
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
    // MARK: - Public Methods
    public func setButtonSelected(isSelected: Bool) {
        
        _isButtonSelected = isSelected
        _isButtonSelected ? _setSelectedState() : _setUnselectedState()
        
    }
}