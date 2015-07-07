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
    var data:DataManager
    
    init(name:String) {
        self.name = name
        self.data = DataManager(filename: "mraid-tests.beautified", filetype:"js")
    }
    

}
var core = Core(name:"Awesome Global Class")


