//
//  SlidingTabParent.swift
//  slidingTabController
//
//  Created by jason debottis on 10/3/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit
class TabGroup: UIView {
    let slidingGesture = UIPanGestureRecognizer()
    let tapGesture = UITapGestureRecognizer()
    var lastLocationTouched = CGPoint()
    var tabWidth = CGFloat()
    var tabHeight = CGFloat()
    var pageWidth = CGFloat()
    var contentPage = ContentPage()
    var tab = Tab()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, tabNumber: CGFloat, color: UIColor) {
        super.init(frame: frame)
        tabWidth = CGFloat(self.frame.size.width / 4)
        tabHeight = CGFloat(self.frame.size.height / 10)
        pageWidth = tabWidth * 2
        
        let tabFrame = CGRectMake(0, 30, tabWidth, tabHeight)
        let diff = self.tab.center.x - self.center.x
        let contentFrame = CGRectMake(diff - self.tab.center.x , 30 + tabHeight, pageWidth, self.frame.size.height - (tabHeight + 30))
        let colors = [UIColor.purpleColor(), UIColor.blueColor(), UIColor.redColor(), UIColor.greenColor()]
        
        
        tab = Tab(frame: tabFrame, color: color, tabLabel: "")
        contentPage = ContentPage(frame: contentFrame, color: color)
        
        self.addSubview(tab)
        self.addSubview(contentPage)
        
        for(var i=1; i < 2; i++){
            
            let aTab = Tab(frame: tabFrame, color: colors[Int(i)], tabLabel: "")
            aTab.tag = Int(i)
            aTab.center = CGPointMake(tab.center.x + (tabWidth * CGFloat(i)), tab.center.y)
            
            let aContentPage = ContentPage(frame: contentFrame, color: colors[Int(i)])
            aContentPage.tag = Int(i)
            aContentPage.center = CGPointMake(contentPage.center.x + (pageWidth * CGFloat(i)), contentPage.center.y)
            
            self.addSubview(aTab)
            self.addSubview(aContentPage)
        }
        
        slidingGesture.addTarget(self, action: "slideTabBar")
        self.addGestureRecognizer(slidingGesture)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must implement SlidingTabsParent init")
    }
    
    func slideTabBar(){
        let touchPoint = slidingGesture.locationInView(self)
        let translation = slidingGesture.translationInView(self)
        
        
        if CGRectContainsPoint(tab.frame, touchPoint){
            
        }
        UIView.animateWithDuration(0.1, animations: {
            let diff = self.center.x - self.tab.center.x
            print("Diff \(diff)")
            self.tab.center = CGPointMake(self.lastLocationTouched.x + translation.x, self.tab.center.y)
            self.contentPage.center = CGPointMake(self.tab.center.x - diff, self.contentPage.center.y)
            for case let aTab as Tab in self.subviews{
                
                if aTab.tag == 1 {
                    aTab.center = CGPointMake(self.tab.center.x + self.tabWidth, self.tab.center.y)
                }else{
                    let prevTab = self.viewWithTag(aTab.tag - 1)
                    if aTab.tag > 0 {
                        
                        aTab.center = CGPointMake(prevTab!.center.x + self.tabWidth, self.tab.center.y)
                    }
                }
                
            }
            for case let aContentPage as ContentPage in self.subviews{
                if aContentPage.tag == 1{
                    aContentPage.center = CGPointMake(self.contentPage.center.x + self.pageWidth, self.contentPage.center.y)
                }
            }
            
            
        })
        if slidingGesture.state == UIGestureRecognizerState.Ended {
            for case let aTab as Tab in self.subviews{
                if CGRectContainsPoint(aTab.frame, CGPointMake(self.center.x, aTab.center.y)){
                     aTab.center = CGPointMake(self.center.x, self.tab.center.y)
                    UIView.animateWithDuration(0.1, animations: {
                        if(aTab.tag == 1){
                             aTab.center = CGPointMake(self.center.x , self.tab.center.y)
                            for case let aContentPage as ContentPage in self.subviews{
                                if aContentPage.tag == aTab.tag {
                                    aContentPage.center = CGPointMake(aTab.center.x, self.contentPage.center.y)
                                }
                            }
                        }else{
                            //let prevTab = self.viewWithTag(aTab.tag - 1)
                            //if
                        }
                       
                    })
                    
                }
            }
//            if CGRectContainsPoint(tab.frame, CGPointMake(self.center.x, tab.center.y)){
//                UIView.animateWithDuration(0.1, animations: {
//                    self.tab.center = CGPointMake(self.center.x, self.tab.center.y)
//                    self.contentPage.center = CGPointMake(self.tab.center.x, self.contentPage.center.y)
//                    for case let aTab as Tab in self.subviews{
//                        if aTab.tag == 1 {
//                            aTab.center = CGPointMake(self.tab.center.x + self.tabWidth, self.tab.center.y)
//                        }
//                    }
//                    for case let aContentPage as ContentPage in self.subviews{
//                        if aContentPage.tag == 1{
//                            aContentPage.center = CGPointMake(self.contentPage.center.x + self.pageWidth, self.contentPage.center.y)
//                        }
//                    }
//                })
//                
//            }
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        var touch = UITouch()
        touch = touches.first!
        let touchPoint = touch.locationInView(self)
        lastLocationTouched = touchPoint
    }
}
