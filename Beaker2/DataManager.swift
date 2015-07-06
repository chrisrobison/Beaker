//
//  DataManager.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/29/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//

import Foundation

class DataManager {
    var prefs = [String:AnyObject](),
        state = [String:AnyObject](),
        config:JSON,
        loaded:Bool
    
    init(filename:String, filetype:String) {
        var path = NSBundle.mainBundle().pathForResource(filename, ofType: filetype),
        url      = NSURL(fileURLWithPath: path!),
        data     = NSData(contentsOfURL: url!),
        content  = NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as? [[String: AnyObject]]
        
        self.config = JSON(data: data!)
        self.loaded = true
    }
    
    class func loadDataFromFileWithSuccess(filename:String, filetype:String, success: ((data: NSData) -> Void)) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let filePath = NSBundle.mainBundle().pathForResource(filename, ofType:filetype)
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        var session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData!, response: NSURLResponse!, error: NSError!) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    var statusError = NSError(domain:"conversantmedia.com", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}