//
//  customSeguesUnwind.swift
//  TipCal
//
//  Created by Farrell, Ryan on 12/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class customSeguesUnwind: UIStoryboardSegue {
    override func perform() {
        // Assign the source and destination views to local variables.
<<<<<<< HEAD
        let secondVCView = self.sourceViewController.view as UIView!
        let firstVCView = self.destinationViewController.view as UIView!
=======
        var secondVCView = self.sourceViewController.view as UIView!
        var firstVCView = self.destinationViewController.view as UIView!
>>>>>>> 04283949d00eea60e0019f1a957b2d27f4cfde00
        
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(firstVCView, aboveSubview: secondVCView)
        
        // Animate the transition.
        UIView.animateWithDuration(0.4, animations: { () -> Void in
            firstVCView.frame = CGRectOffset(firstVCView.frame, 0.0, screenHeight)
            secondVCView.frame = CGRectOffset(secondVCView.frame, 0.0, screenHeight)
            
            }) { (Finished) -> Void in
                
                self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
}
