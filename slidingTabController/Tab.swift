//
//  Tab.swift
//  slidingTabController
//
//  Created by jason debottis on 10/3/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit
class Tab: UIView {
    var inCenter = Bool()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, color: UIColor, tabLabel: String) {
        super.init(frame: frame)
        self.backgroundColor = color;
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must implement init")
    }
    
    func getViewInCenter() -> UIView {
        return self;
    }
}
