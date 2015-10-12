//
//  ViewController.swift
//  slidingTabController
//
//  Created by jason debottis on 10/3/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit

class SlidingTabViewController: UIViewController {
    
    var slidingTabGroup = TabGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        slidingTabGroup = TabGroup(frame: self.view.frame, tabNumber: 3, color: UIColor.purpleColor())
        self.view.addSubview(slidingTabGroup)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

