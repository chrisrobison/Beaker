//
//  BeakerMainViewController.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/25/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//
import CoreData
import Foundation
import UIKit


class BeakerViewController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.hidden = true
        
        var ad = GSSDKInfo()
        var x = GSAdModel()
       /* let newItem = NSEntityDescription.insertNewObjectForEntityForName("AdTest", inManagedObjectContext: self.managedObjectContext!) as! AdTest
        newItem.setName = "Cobalt MRAID Tests"
        newItem.notes = "Notes!"
*/
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        
        /*
        let fetchRequest = NSFetchRequest(entityName: "AdTest")
        
        // Execute the fetch request, and cast the results to an array of LogItem objects
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [AdTest] {
            
            // Create an Alert, and set it's message to whatever the itemText is
            let alert = UIAlertController(title: fetchResults[0].setName,
                message: fetchResults[0].notes,
                preferredStyle: .Alert)
            
            // Display the alert
            self.presentViewController(alert,
                animated: true,
                completion: nil)
        }
*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


