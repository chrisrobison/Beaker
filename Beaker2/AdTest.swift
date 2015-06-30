//
//  AdTest.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/29/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//

import Foundation
import CoreData

class AdTest: NSManagedObject {

    @NSManaged var notes: String
    @NSManaged var setName: String
    @NSManaged var source: String
    @NSManaged var tests: NSSet

    class func createInManagedObjectContext(moc: NSManagedObjectContext, setName: String, notes: String) -> AdTest {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("AdTest", inManagedObjectContext: moc) as! AdTest
        newItem.setName = setName
        newItem.notes = notes
        return newItem
    }
}
