//
//  SampleAppMainNavigationPage.swift
//  slidingTabController
//
//  Created by jason debottis on 10/12/15.
//  Copyright © 2015 jason debottis. All rights reserved.
//

import UIKit
class SampleAppMainNavigationpage: UITableViewController{
    
    
    @IBOutlet var viewControllerTable: UITableView!
    
    var viewControllers = NSArray()
    var titles = NSArray()
    var storyBoardId = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        let slidingTabController = SlidingTabViewController()
        
        titles = ["SlidingTabController"]
        viewControllers = [slidingTabController]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(30)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel?.text = titles[indexPath.row] as? String
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Int(1)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var selectedViewController = viewControllers[indexPath.row] as? UIViewController
        selectedViewController = self.storyboard?.instantiateViewControllerWithIdentifier((titles[indexPath.row] as? String)!)
        self.presentViewController(selectedViewController!, animated: true, completion: nil)
    }
}
