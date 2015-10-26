//
//  HomeViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 02/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, NSURLConnectionDelegate {

    @IBOutlet var tblViewOptions: UITableView!
    var arrayHomeOptions : NSArray!
    var arrayControlOptions : NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrayHomeOptions = NSArray(objects: "Map View", "Collection View", "Web View")
        arrayControlOptions = NSArray(objects: "Common controls")
        
        
        let param:NSDictionary = ["email":"username" as String!, "pass": "pass" as String!]
        let webOperation = WebOperation()
        webOperation.callServiceWithUrl("LOGINURL", param: param, completion: { (result) -> Void in
           
            let status = result.objectForKey("status")?.boolValue
            if status == true {
                
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableView DataSource
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "Storyboard Home"
        }else{
            return "Storyboard Controls"
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
            return arrayHomeOptions.count
        }else{
            return arrayControlOptions.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        
        if indexPath.section == 0 {
            cell.textLabel!.text = arrayHomeOptions[indexPath.row] as? String
        }else{
            cell.textLabel!.text = arrayControlOptions[indexPath.row] as? String
        }
        
        return cell
    }
   
    //MARK: - UITableView Delegates
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        if indexPath.section == 0 {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            if indexPath.row == 0 {
                let controller = storyboard.instantiateViewControllerWithIdentifier("MapViewController") 
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row == 1{
                let controller = storyboard.instantiateViewControllerWithIdentifier("CollectionViewController") 
                self.navigationController?.pushViewController(controller, animated: true)
            }else if indexPath.row == 2{
                let controller = storyboard.instantiateViewControllerWithIdentifier("WebViewController") 
                self.navigationController?.pushViewController(controller, animated: true)
            }
        } else {
            let storyboard = UIStoryboard(name: "Controls", bundle: nil)
            if indexPath.row == 0 {
                let controller = storyboard.instantiateViewControllerWithIdentifier("CommonViewController") 
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
}
