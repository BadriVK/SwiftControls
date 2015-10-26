//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 02/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var txtFdUserName: UITextField!
    @IBOutlet var txtFdPassword: UITextField!
    
    //MARK: - UIView Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstLeftPadding = UIView(frame: CGRectMake(0, 0, 10, 30))
        firstLeftPadding.backgroundColor=UIColor.clearColor()
        txtFdUserName.leftView = firstLeftPadding
        txtFdUserName.leftViewMode = UITextFieldViewMode.Always
        
        let secondLeftPadding=UIView(frame: CGRectMake(0, 0, 10, 30))
        secondLeftPadding.backgroundColor=UIColor.clearColor()
        txtFdPassword.leftView = secondLeftPadding
        txtFdPassword.leftViewMode = UITextFieldViewMode.Always

        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        self.navigationController?.pushViewController(controller, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginBtnAction(sender: AnyObject) {
        
        let username = txtFdUserName.text
        let password = txtFdPassword.text
       
        if username!.isEmpty {
         
            let alertView = UIAlertController(title: "Message!", message: "Username missing.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        
        }else if password!.isEmpty {
        
            let alertView = UIAlertController(title: "Message!", message: "Password missing.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
       
        } else if isValidEmail(username!) {
        
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let controller = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") 
            self.navigationController?.pushViewController(controller, animated: true)
        
        } else {
           
            let alertView = UIAlertController(title: "Message!", message: "Invalid Email.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
            
            /*let alertView = UIAlertController(title: "You need to log in first", message: "To access the special features of the app you need to log in first.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "Login", style: .Default, handler: { (alertAction) -> Void in
                //logUserIn()
            }))
            alertView.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)*/
        }
       
    }
    
    //MARK: - UITextField Email Validation
    
    func isValidEmail(testStr:String) -> Bool {
        
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    //MARK: - UITextField Delegates
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.view.endEditing(true)
       // if textField == txtFdUserName {
       //     txtFdPassword.becomeFirstResponder()
       // }else{
            textField.resignFirstResponder()
       // }
        
        return true
    }
}

