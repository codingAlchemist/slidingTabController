//
//  ViewController.swift
//  slidingTabController
//
//  Created by jason debottis on 10/3/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    var slidingTabGroup = TabGroup()
    override func viewDidLoad() {
        super.viewDidLoad()
        slidingTabGroup = TabGroup(frame: self.view.frame, tabNumber: 3, color: UIColor.purpleColor())
        self.view.addSubview(slidingTabGroup)
//        let colors = [UIColor.blackColor(), UIColor.blueColor(), UIColor.redColor()]
//        let tabScrollView = UIScrollView(frame: CGRectMake(0, 0, self.view.frame.width, 50))
//        let tabWidth = CGFloat(self.view.frame.size.width / 3)
//        tabScrollView.delegate = self
//        var i:CGFloat
//        for(i=0;i<3;i++){
//            tabScrollView.addSubview(Tab(frame: CGRectMake(CGFloat(i * tabWidth), 0, self.view.frame.width / 3, 50),color: colors[Int(i)], tabLabel: "" ))
//            
//        }
//        
//        self.view.addSubview(tabScrollView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

