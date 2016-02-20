//
//  DailyGoalViewController.swift
//  arcticrun
//
//  Created by Matt Wiseman on 2016-02-18.
//  Copyright © 2016 COMP4977iPhoneTeam. All rights reserved.
//

import UIKit

class DailyGoalViewController: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (self.revealViewController() != nil) {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    /*
    // MARK: Navigation -
    
    // In a storyboard-based application,you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController
    // Pass the selected object to the new view controller
    }
    */
    
    
    
    
}
