//
//  ViewController.swift
//  ATHMultiSelectionSegmentedControl
//
//  Created by attheodo on 06/03/2016.
//  Copyright (c) 2016 attheodo. All rights reserved.
//

import UIKit
import ATHMultiSelectionSegmentedControl

class ViewController: UIViewController, MultiSelectionSegmentedControlDelegate {

    // MARK: - IBOutlets
    /// The multi selection segmented control
    @IBOutlet weak var multiSegmentedControl: MultiSelectionSegmentedControl!
    /// The label indicating the selected indices
    @IBOutlet weak var selectedIndicesLabel: UILabel!
    /// Button for inserting segments
    @IBOutlet weak var insertSegmentButton: UIButton!
    /// Button for removing segments
    @IBOutlet weak var removeSegmentButton: UIButton!
    /// Button for remove all segments
    @IBOutlet weak var removeAllSegments: UIButton!
    
    // MARK: - View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         Here the control is added as an IBOutlet. You can always add it programmatically like
         
         let multiSegmentedControl = MultiSelectionSegmentedControl()
         view.addSubview(multiSegmentedControl)
        */
        
        multiSegmentedControl.insertSegmentsWithTitles(["Title 1"])
        multiSegmentedControl.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions
    @IBAction func insertSegment(_ sender: UIButton) {
        
        let title = "Title \(String(multiSegmentedControl.numberOfSegments + 1))"
        
        multiSegmentedControl.insertSegmentWithTitle(title, atIndex: multiSegmentedControl.numberOfSegments, animated: true)
        
    }
    
    @IBAction func removeSegment(_ sender: UIButton) {
        multiSegmentedControl.removeSegmentAtIndex(multiSegmentedControl.numberOfSegments, animated: true)
    }
    
    @IBAction func removeAllSegments(_ sender: UIButton) {
        multiSegmentedControl.removeAllSegments()
    }
    
    // MARK: - ATHMultiSelectionSegmentedControlDelegate

    /**
     Delegate method for `MultiSelectionSegmentedControl`. Called only when the user
     interacts with the control and not when the control is configured programmatically!
    */
    func multiSelectionSegmentedControl(_ control: MultiSelectionSegmentedControl, selectedIndices indices: [Int]) {
        
        selectedIndicesLabel.text = "Selected Indices: ["
        
        for index in indices {
            selectedIndicesLabel.text?.append("\(String(index)),")
        }
        
        if indices.count != 0 {
            selectedIndicesLabel.text = String(selectedIndicesLabel.text!.characters.dropLast())
        }
        
        selectedIndicesLabel.text?.append("]")
    
    }

}

