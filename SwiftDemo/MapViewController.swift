//
//  MapViewController.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 02/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MBProgressHUDDelegate {
    
    var HUD: MBProgressHUD?
    @IBOutlet var mapview: MKMapView!
    let reachability = AVReachability.reachabilityForInternetConnection()

    override func viewDidLoad() {
        super.viewDidLoad()

        if reachability?.isReachable() == true {

            HUD = MBProgressHUD(view: self.navigationController!.view)
            self.navigationController!.view.addSubview(HUD!)
            HUD!.dimBackground = true
            
            // Regiser for HUD callbacks so we can remove it from the window at the right time
            HUD!.delegate = self;
            //HUD!.showWhileExecuting("myTask", onTarget: self, withObject: nil, animated: true)
            HUD?.show(true)
            
            // Do any additional setup after loading the view.
            let location = CLLocationCoordinate2D(
                latitude: 22.728874,
                longitude: 75.882584
            )
            
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapview.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = "Palasia"
            annotation.subtitle = "Indore"
            mapview.addAnnotation(annotation)
            
        } else {
            let alertView = UIAlertController(title: "Message!", message: "No network.", preferredStyle: .Alert)
            alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertView, animated: true, completion: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapViewDidFinishLoadingMap(mapView: MKMapView!){
        HUD?.hide(true)

    }
    func mapViewDidFailLoadingMap(mapView: MKMapView!, withError error: NSError!){
        HUD?.hide(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
