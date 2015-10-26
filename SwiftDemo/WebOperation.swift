//
//  WebOperation.swift
//  SwiftDemo
//
//  Created by Arpit Vishwakarma on 04/09/15.
//  Copyright (c) 2015 Arpit. All rights reserved.
//

import AVFoundation

typealias CompletionBlock = (result: NSDictionary) -> Void

class WebOperation: NSObject, NSURLConnectionDelegate {
    
    var block: CompletionBlock!
    override init() {
        super.init() // Fails safety check 1: uuid is not initialized.
    }
    
    func sendRequest(request: NSMutableURLRequest, dataLength paramDataLength: NSString, dataToSend param: NSDictionary) {
        
        request.HTTPMethod = "POST"
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(param, options: NSJSONWritingOptions.PrettyPrinted)
            request.setValue(paramDataLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
                
                if error != nil {
                    print(error!.description)
                    let errorDict = NSDictionary(object: false, forKey: "status")
                    self.block(result: errorDict)
                } else {
                    if let httpResponse = response as? NSHTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            do {
                                if let data = data, let jsonResult = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? NSDictionary {
                                    self.block(result: jsonResult)
                                }
                            } catch let JSONError as NSError {
                                print(JSONError)
                                let errorDict = NSDictionary(object: false, forKey: "status")
                                self.block(result: errorDict)
                            }
                        } else if (httpResponse.statusCode == 422) {
                            print("422 Error Occured...")
                            let errorDict = NSDictionary(object: false, forKey: "status")
                            self.block(result: errorDict)
                        }
                    } else {
                        print("Can't cast response to NSHTTPURLResponse")
                        let errorDict = NSDictionary(object: false, forKey: "status")
                        self.block(result: errorDict)
                    }
                }
            }
            
            task.resume()
            
        } catch {
            // failure
            print("Fetch failed: \((error as NSError).localizedDescription)")
        }
    }
    
    func callServiceWithUrl(urlString:NSString, param: NSDictionary, completion: CompletionBlock) -> Void {
        
        //let urlString = String(format: "%@%@", API_MAIN_URL, url)
        let url = NSURL(string: urlString as String)
        let request = NSMutableURLRequest(URL: url!)
        
        let postData : NSData = NSKeyedArchiver.archivedDataWithRootObject(param)
        let modifiedURLString = NSString(format:"%lu", postData.length) as String
        self.sendRequest(request, dataLength: modifiedURLString, dataToSend: param)
        block = completion
        
    }
}
