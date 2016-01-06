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
        
<<<<<<< HEAD
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
=======
<<<<<<< HEAD
        let swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
=======
        var swipeGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "showSecondViewController")
>>>>>>> 04283949d00eea60e0019f1a957b2d27f4cfde00
>>>>>>> 3d4b494830a2592e45cd99c1ae953acda8d18afd
        swipeGestureRecognizer.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeGestureRecognizer)
        
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
        
        splitField.center.x =  -30
        //@IBOutlet weak var tipLabel: UILabel!
        //@IBOutlet weak var tipppLabel: UILabel!
        //@IBOutlet weak var totalppLabel: UILabel!
        //@IBOutlet weak var totaltipLabel: UILabel!
        //@IBOutlet weak var totalLabel: UILabel!
        
        billamountField.center.x = self.view.frame.width + 30
        
        
        UIView.animateWithDuration(1.5, delay: 0.3, usingSpringWithDamping: 40.0, initialSpringVelocity: 4.0, options: [], animations: ({
            
            self.billamountField.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(1.5, delay: 0.3, usingSpringWithDamping: 40.0, initialSpringVelocity: 4.0, options: [], animations: ({
            
            self.splitField.center.x = self.view.frame.width / 2
            
        }), completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
                self.tipController.alpha = 1.0
            }, completion: nil)
        
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.totalLabel.alpha = 1.0
            }, completion: nil)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.tipController.alpha = 0.0
        self.totalLabel.alpha = 0.0
       
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func showSecondViewController() {
        self.performSegueWithIdentifier("firstId", sender: self)
    }
    
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue){
        
    }
    
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 3d4b494830a2592e45cd99c1ae953acda8d18afd

    @IBAction func enlargen2(sender: AnyObject) {
        self.popTotalLabel()
    }
    
    @IBAction func enlargen(sender: AnyObject) {
        self.popTotalLabel()
    }
    
    @IBAction func enlargen3(sender: AnyObject) {
        self.popTotalLabel()
    }
    func popTotalLabel()
    {
<<<<<<< HEAD
        let default_transform = self.totalLabel.transform
        
        self.totalLabel.transform = CGAffineTransformScale(default_transform, 0.35, 0.35)
        
        UIView.animateWithDuration(0.25, animations: {
            self.totalLabel.transform = CGAffineTransformScale(default_transform, 2, 2);
            }, completion: { finished in
                UIView.animateWithDuration(0.25, animations: {
                    self.totalLabel.transform = CGAffineTransformScale(default_transform, 1, 1) } )
        })
    }
    
=======
        self.totalLabel.transform = CGAffineTransformScale(self.tipLabel.transform, 0.35, 0.35)
        
        UIView.animateWithDuration(0.25, animations: {
            self.totalLabel.transform = CGAffineTransformScale(self.tipLabel.transform, 2, 2);
            }, completion: { finished in
                UIView.animateWithDuration(0.25, animations: {
                    self.totalLabel.transform = CGAffineTransformScale(self.tipLabel.transform, 1, 1) } )
        })
    }
    
=======
>>>>>>> 04283949d00eea60e0019f1a957b2d27f4cfde00
>>>>>>> 3d4b494830a2592e45cd99c1ae953acda8d18afd
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "firstIdUnwind" {
                let unwindSegue = customSeguesUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)!
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

