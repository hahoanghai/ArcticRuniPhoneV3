//
//  PedometerViewController.swift
//  arcticrun
//
//  Created by Matt Wiseman on 2016-02-18.
//  Copyright © 2016 COMP4977iPhoneTeam. All rights reserved.
//

import UIKit
import CoreMotion

class PedometerViewController: UIViewController {
    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var stepsText: UILabel!
    let pedoMeter = CMPedometer()
    var timer = NSTimer()
    var rightNow:NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (self.revealViewController() != nil) {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    //Set the date to start from now and start running step function in intervals
    @IBAction func start(sender : AnyObject) {
        rightNow = NSDate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.75, target: self, selector: Selector("updateCounting"), userInfo: nil, repeats: true)
    }
    
    //Count the number of steps
    func updateCounting() {
        if(CMPedometer.isStepCountingAvailable()){
            self.pedoMeter.queryPedometerDataFromDate(rightNow!, toDate: NSDate()) { (data : CMPedometerData?, error) -> Void in
                print(data)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if(error == nil){
                        self.stepsText.text = "\(data!.numberOfSteps)"
                    }
                })
                
            }
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
