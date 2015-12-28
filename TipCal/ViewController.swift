//
//  ViewController.swift
//  TipCal
//
//  Created by Jasmine Farrell on 12/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

var viewBillAmount = Double(0)
var viewSplitNum = Int(0)
var tipSelection = Int(0)

class ViewController: UIViewController {

    @IBOutlet weak var billamountField: UITextField!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipppLabel: UILabel!
    @IBOutlet weak var totalppLabel: UILabel!
    @IBOutlet weak var totaltipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    
    let defautls: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billamountField.textAlignment = .Center
        splitField.textAlignment = .Center
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        
        if (viewBillAmount != 0)
        {
            self.billamountField.text = String(format: "%.2f", viewBillAmount)
        }
        
        if(viewSplitNum == 0)
        {
            self.splitField.text = String(format: "")
        } else
        {
            self.splitField.text = String(format: "%d", viewSplitNum)
        }
        self.tipController.selectedSegmentIndex = tipSelection
        onEditingChanged(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let billAmount = NSString(string: billamountField.text!).doubleValue
        var tipPercentage = 0.0
        let tipPercentages = [0.15, 0.18, 0.2, 0.25]
        if (tipController.selectedSegmentIndex == 4){
            let defaults = NSUserDefaults.standardUserDefaults()
            tipPercentage = defaults.doubleForKey("tip percentage")
        } else {
            tipPercentage = tipPercentages[tipController.selectedSegmentIndex]
        }
        
        var splitValue = NSString(string: splitField.text!).doubleValue
        if (splitValue == 0 || splitValue < 0) {
            splitValue = 1
        }
        
        viewBillAmount = billAmount
        viewSplitNum = Int(splitValue)
        tipSelection = tipController.selectedSegmentIndex
        
        
        let tip = billAmount * tipPercentage
        let total = (billAmount + tip) / splitValue
        let totalNtip = (billAmount / splitValue)
        let totalTip = (billAmount + tip)
        
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        
        
        tipLabel.text = formatter.stringFromNumber(tip)
        //tipLabel.text = "$\(tip)"
        totalLabel.text = formatter.stringFromNumber(totalTip/splitValue)
        //totalLabel.text = "$\(totalTip)"
        totalppLabel.text = formatter.stringFromNumber(totalNtip)
        // "$\(totalNtip)"
        tipppLabel.text = formatter.stringFromNumber(tip / splitValue)
        //"$\(tip / splitValue)"
        totaltipLabel.text = formatter.stringFromNumber( totalTip)
        //"$\(billAmount + totalTip)"
        
    }
    
    //the tip percentage reflect the new default value
    override func viewWillAppear(animated: Bool) {
        
        //locale functionality
        super.viewWillAppear(animated)
    
        if let symbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol)
            
        {
            billamountField.attributedPlaceholder = NSAttributedString(string: "\(symbol)", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
        }
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
       
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Optionally initialize the property to a desired starting value
//    self.firstView.alpha = 0
//    self.secondView.alpha = 1
//    UIView.animateWithDuration(0.4, animations: {
    
    // This causes first view to fade in and second view to fade out
//    self.firstView.alpha = 1
//    self.secondView.alpha = 0
//    })
}

