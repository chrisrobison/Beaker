//
//  Global.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/28/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//
//
//  Global.swift
//  TheWordDrop
//
//  Created by Christopher Robison on 5/12/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//
import Foundation

class Core {
    var name:String
    var prefs = [String:AnyObject]()
    
    init(name:String) {
        self.name = name
    }
    
    final func randomInt(range:Int) -> Int {
        return Int(arc4random_uniform(UInt32(range)))
    }
    
    func pathToDocsFolder() -> String {
        let pathToDocumentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        return pathToDocumentsFolder.stringByAppendingPathComponent("/prefs.plist")
    }
    
    func readPreferences() {
        var myDict: NSDictionary?
        
        let theFileManager = NSFileManager.defaultManager()
        
        if theFileManager.fileExistsAtPath(pathToDocsFolder()) {
            println("File Found!")
        }
        else {
            // Copy the file from the Bundle and write it to the Device:
            let pathToBundledDB = NSBundle.mainBundle().pathForResource("Preferences", ofType: "plist")
            let pathToDevice = pathToDocsFolder()
            
            let error:NSError?
            
            // Here is where I get the error:
            if (theFileManager.copyItemAtPath(pathToBundledDB!, toPath:pathToDevice, error:nil)) {
                // success
            }
            else {
                // failure 
            }
        }
        
        let pathToDocumentsFolder = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let pathToPlistFile = pathToDocumentsFolder.stringByAppendingPathComponent("Preferences.plist")
        
        if let path = NSBundle.mainBundle().pathForResource("Preferences", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        } else {
            
        }
        if let dict = myDict {
            
        }
    }
}
var core = Core(name:"Awesome Global Class")


