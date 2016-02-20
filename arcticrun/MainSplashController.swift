//
//  MainSplashController.swift
//  arcticrun
//
//  Created by Hai Hoang Ha on 2016-02-19.
//  Copyright © 2016 COMP4977iPhoneTeam. All rights reserved.
//

import UIKit

class MainSplashController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var seasonPicker: UIPickerView!

    @IBOutlet weak var synopsisText: UITextView!
    var seasonArray:[String]!
    var missionArray:[String]!
    var season:String!
    var mission:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        seasonArray = ["season 1","season 2","season 3","season 4"]
        missionArray = ["mission 1","mission 2","mission 3","mission 4","mission 5","mission 6","mission 7","mission 8","mission 9","mission 10","mission 11","mission 12"]
        
        season = seasonArray[0]
        mission = missionArray[0]
        synopsisText.text = season + "\t" + mission
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView)->Int{
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component:Int)->Int{
        if component == 0 {
            return seasonArray.count
        }
            
        else {
            return missionArray.count
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            return seasonArray[row]
        }else{
            return missionArray[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0{
            season = seasonArray[row]
        }
        else{
            mission = missionArray[row]
        }
        synopsisText.text = season + "\t" + mission
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
