//
//  Defaults.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/29/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//

import Foundation
import CoreData

class Defaults: AdTest {

    @NSManaged var guid: String
    @NSManaged var ipv4: String
    @NSManaged var sendGPS: NSNumber
    @NSManaged var server: String
    @NSManaged var useBudget: NSNumber
    @NSManaged var useFrequencyCapping: NSNumber
    @NSManaged var testDefaults: AdTest

}
