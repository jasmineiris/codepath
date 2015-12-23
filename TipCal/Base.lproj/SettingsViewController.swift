//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Jasmine Farrell on 12/9/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    
    @IBAction func percentAction(sender: AnyObject) {
        let currentValue = Double(percentSlider.value)
        percentLabel.text = String(format: "%.0f%%", currentValue)
        let normPerc = currentValue / 100
        
    //To save a key to NSUserDefaults, do something like this:
        //var defaultPercent:String = String(format: "
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(normPerc, forKey: "tip percentage")
        defaults.synchronize()
    
    //synchronize to guarantee that your updates are saved.

    }
}
    
   


    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


