//
//  ViewController.swift
//  ATHMultiSelectionSegmentedControl
//
//  Created by attheodo on 06/03/2016.
//  Copyright (c) 2016 attheodo. All rights reserved.
//

import UIKit
import ATHMultiSelectionSegmentedControl

class ViewController: UIViewController {

    @IBOutlet weak var multiSegmentedControl: MultiSelectionSegmentedControl!
    @IBOutlet weak var segmented: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        multiSegmentedControl.insertSegmentsWithTitles(["one", "two", "three"])

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            //self.segmented.insertSegmentWithTitle("lala", atIndex: 2, animated: false)
            //self.multiSegmentedControl.removeSegmentAtIndex(2, animated: true)
            self.multiSegmentedControl.insertSegmentWithTitle("four", atIndex: 4, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

