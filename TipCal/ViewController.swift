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

    
   
    @IBOutlet weak var newPercentLabel: UILabel!
    @IBOutlet weak var billamountField: UITextField!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipppLabel: UILabel!
    @IBOutlet weak var totalppLabel: UILabel!
    @IBOutlet weak var totaltipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipController: UISegmentedControl!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(totalTip)"
        totalppLabel.text = "$\(totalNtip)"
        tipppLabel.text = "$\(tip / splitValue)"
        totaltipLabel.text = "$\(billAmount + totalTip)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        totalppLabel.text = String(format: "$%.2f", (totalNtip))
        tipppLabel.text = String(format: "$%.2f", (tip / splitValue))
        totaltipLabel.text = String(format: "$%.2f", (billAmount + tip))
    }
    
    
    
    //the tip percentage reflect the new default value
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func newPercent(sender: AnyObject) {
        //To load a key from NSUserDefaults, do something like this:
        _ = NSUserDefaults.standardUserDefaults()
        
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

