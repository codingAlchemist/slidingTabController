//
//  ContentPage.swift
//  slidingTabController
//
//  Created by jason debottis on 10/3/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit
class ContentPage: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must implement ContentPage init")
    }
}
