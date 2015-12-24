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
        let currentValue = Int(percentSlider.value)
        let normPerc = Double(currentValue) / 100
        
        percentLabel.text = String(format: "Custom Tip: %d%%", currentValue)
        
        
    //To save a key to NSUserDefaults, do something like this:
        //var defaultPercent:String = String(format: "
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(normPerc, forKey: "tip percentage")
        defaults.synchronize()
    
    //synchronize to guarantee that your updates are saved.

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = Int(defaults.doubleForKey("tip percentage") * 100)
        self.percentLabel.text = String(format: "Custom Tip: %d%%", defaultTip)
        self.percentSlider.value = Float(defaultTip)
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

