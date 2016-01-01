//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Jasmine Farrell on 12/9/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // create instance of our custom transition manager

    
    @IBOutlet weak var customTipLabel: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var currencyButton: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func percentAction(sender: AnyObject) {
        let currentValue = Int(percentSlider.value)
        let normPerc = Double(currentValue) / 100
        
        percentLabel.text = String(format: "%d%%", currentValue)
        
        
    //To save a key to NSUserDefaults, do something like this:
        //var defaultPercent:String = String(format: "
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(normPerc, forKey: "tip percentage")
        defaults.synchronize()
    
    //synchronize to guarantee that your updates are saved.

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showFirstViewController")
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
        let defaultTip = Int(defaults.doubleForKey("tip percentage") * 100)
        self.percentLabel.text = String(format: "%d%%", defaultTip)
        self.percentSlider.value = Float(defaultTip)
        self.view.backgroundColor = UIColor.blackColor()
        
        
        currencyButton.center.x = self.view.frame.width + 30
        percentLabel.center.x = self.view.frame.width + 30
        percentSlider.center.x = self.view.frame.width + 30
        customTipLabel.center.x = self.view.frame.width + 30
        
        UIView.animateWithDuration(8, delay: 0.3, usingSpringWithDamping: 40.0, initialSpringVelocity: 4.0, options: [], animations: ({
            
            self.currencyButton.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(4.0, delay: 0.2, usingSpringWithDamping: 30.0, initialSpringVelocity: 3.0, options: [], animations: ({
            
            self.percentLabel.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(4.0, delay: 0.2, usingSpringWithDamping: 10.0, initialSpringVelocity: 3.0, options: [], animations: ({
            
            self.percentSlider.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(4.0, delay: 0.3, usingSpringWithDamping: 40.0, initialSpringVelocity: 6.0, options: [], animations: ({
            
            self.customTipLabel.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    
    
   @IBAction func currencySettings(sender: AnyObject) {
       let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)!
       UIApplication.sharedApplication().openURL(settingsURL)
    }
    
    func showFirstViewController() {
        self.performSegueWithIdentifier("firstIdUnwind", sender: self)
    }
    
    @IBAction func returnMain(sender: UIBarButtonItem) {
        self.performSegueWithIdentifier("firstIdUnwind", sender: self)
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


