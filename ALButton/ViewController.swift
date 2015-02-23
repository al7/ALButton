//
//  ViewController.swift
//  ALButton
//
//  Created by Alexandre Leite on 2/22/15.
//  Copyright (c) 2015 Alexandre Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK- View lifecycle
    
    override func loadView() {
        self.view = UIView(frame: UIScreen.mainScreen().bounds)
        self.view.backgroundColor = UIColor.whiteColor()
        
        let enableButton = ALButton(title: "Enable")
        enableButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(enableButton)
        
        let disableButton = ALButton(title: "Disable")
        disableButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(disableButton)
        
        let views = ["enableButton": enableButton, "disableButton": disableButton]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[enableButton]-[disableButton]-|", options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[enableButton(44)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[disableButton(44)]", options: NSLayoutFormatOptions(0), metrics: nil, views: views))
        self.view.addConstraint(NSLayoutConstraint(item: enableButton, attribute: .CenterY, relatedBy: .Equal, toItem: enableButton.superview, attribute: .CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: disableButton, attribute: .CenterY, relatedBy: .Equal, toItem: disableButton.superview, attribute: .CenterY, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: disableButton, attribute: .Width, relatedBy: .Equal, toItem: enableButton, attribute: .Width, multiplier: 1, constant: 0))
        
        
        enableButton.touchUpInside {
            sender in
            
            if disableButton.enabled {
                let alertView = UIAlertView(title: "Button Touched", message: "Disable Button is already enabled", delegate: nil, cancelButtonTitle: "Ok")
                alertView.show()
            }
            else {
                disableButton.enabled = true
            }
        }
        
        disableButton.touchUpInside {
            sender in
            
            disableButton.enabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}

