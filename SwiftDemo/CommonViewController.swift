//
//  CommonViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 03/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit

class CommonViewController: UIViewController {

    var labelStepperValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //UILabel
        let label = UILabel(frame: CGRectMake(0, 80, 100, 100))
        label.backgroundColor = UIColor.lightGrayColor()
        label.text = "Label"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
        
        //UIButton
        let button   = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(110, 80, 100, 100);
        //button.setBackgroundImage(image, forState: UIControlState.Normal)
        button .setTitle("Buton", forState: UIControlState.Normal)
        button .setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.backgroundColor = UIColor.lightGrayColor()
        button.addTarget(self, action: "pressed:", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        //UIImageView
        let imageView = UIImageView(frame: CGRectMake(220, 80, 100, 100))
        imageView.image = UIImage(named: "images")
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView.layer.borderWidth = 5.0
        imageView.layer.cornerRadius = 2.0
        
        //UILabel subview of Image view
        let imgVwLabel = UILabel(frame: CGRectMake(0, 80, 100, 20))
        imgVwLabel.backgroundColor = UIColor.darkGrayColor()
        imgVwLabel.text = "Image View"
        imgVwLabel.textAlignment = NSTextAlignment.Center
        imgVwLabel.font = UIFont.systemFontOfSize(12.0)
        imgVwLabel.textColor = UIColor.whiteColor()
        imageView.addSubview(imgVwLabel)
        self.view.addSubview(imageView)

        //UIView
        let customView = UIView(frame: CGRectMake(0, 190, 100, 100));
        customView.backgroundColor = UIColor.lightGrayColor()
        
        //UILabel subview of Custom view
        let cstmVwLabel = UILabel(frame: CGRectMake(0, 80, 100, 20))
        cstmVwLabel.backgroundColor = UIColor.darkGrayColor()
        cstmVwLabel.text = "Custom View"
        cstmVwLabel.textAlignment = NSTextAlignment.Center
        cstmVwLabel.font = UIFont.systemFontOfSize(12.0)
        cstmVwLabel.textColor = UIColor.whiteColor()
        customView.addSubview(cstmVwLabel)
        self.view.addSubview(customView)

        //UIStepper
        let stepper = UIStepper(frame: CGRectMake(0, 300, 100, 40))
        stepper.minimumValue = 1;
        stepper.maximumValue = 10;
        stepper.addTarget(self, action: "stepperValueChanged:", forControlEvents:UIControlEvents.ValueChanged)

        self.view.addSubview(stepper)

        labelStepperValue = UILabel(frame: CGRectMake(110, 300, 100, 40))
        labelStepperValue.backgroundColor = UIColor.darkGrayColor()
        labelStepperValue.text = "Value"
        labelStepperValue.textAlignment = NSTextAlignment.Center
        labelStepperValue.font = UIFont.systemFontOfSize(12.0)
        labelStepperValue.textColor = UIColor.whiteColor()
        self.view.addSubview(labelStepperValue)
        
        
        let items = ["one", "two", "three"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.frame = CGRect(x: 10, y: 350, width: 300, height: 30)
        segmentedControl.addTarget(self, action: Selector("segementValueChanged:"), forControlEvents: .ValueChanged)
        segmentedControl.selectedSegmentIndex = 1
        self.view.addSubview(segmentedControl)
        
    }

    
    func segementValueChanged(sender: UISegmentedControl!) {
        labelStepperValue.text = NSString(format: "%.2f",sender.selectedSegmentIndex) as String
    }
    
    func stepperValueChanged(sender: UIStepper!) {
        labelStepperValue.text = NSString(format: "%.2f",sender.value) as String
    }
    
    func pressed(sender: UIButton!) {
        let alertView = UIAlertView();
        alertView.addButtonWithTitle("Ok");
        alertView.title = "Yeah!";
        alertView.message = "Clicked on button";
        alertView.show();
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
