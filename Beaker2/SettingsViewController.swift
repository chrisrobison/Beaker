//
//  SettingsViewController.swift
//  Beaker2
//
//  Created by Christopher Robison on 6/26/15.
//  Copyright (c) 2015 Christopher Robison. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var serverTitle: UILabel!
    @IBOutlet weak var serverLabel: UILabel!
    @IBOutlet weak var serverDetail: UILabel!
    @IBOutlet weak var appTitle: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var appDetail: UILabel!
    @IBOutlet weak var spoofIPInput: UITextField!
    @IBOutlet weak var MIDTextInput: UITextField!
    @IBOutlet weak var serverMode: UISegmentedControl!
    @IBOutlet weak var GPSSwitch: UISwitch!
    @IBOutlet weak var fetchMIDSwitch: UISwitch!
    @IBOutlet weak var overrideGeotargeting: UISwitch!
    @IBOutlet weak var overrideBudgetCap: UISwitch!
    @IBOutlet weak var overrideFrequencyCap: UISwitch!
    @IBOutlet weak var spoofIPSwitch: UISwitch!
    
    var boolItems = [String:UISwitch]()
    var stringItems = [String:AnyObject]()
    var numberItems = [String:AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = false
        
        boolItems = ["GPSSwitch":GPSSwitch, "fetchMIDSwitch":fetchMIDSwitch, "overrideGeotargeting":overrideGeotargeting, "overrideBudgetCap": overrideBudgetCap, "overrideFrequencyCap": overrideFrequencyCap, "spoofIPSwitch": spoofIPSwitch]
        stringItems = ["serverLabel":serverLabel, "serverDetail": serverDetail, "appLabel": appLabel, "appDetail": appDetail, "spoofIPInput": spoofIPInput, "MIDTextInput": MIDTextInput]
        numberItems = ["serverMode": serverMode]
        
        var ad = GSAdModel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPrefs() {
        
    }
    
    func savePrefs() {
        for (key, item) in boolItems {
            NSUserDefaults.standardUserDefaults().setBool(item.on, forKey: key)
        }
        
        for (key, item) in stringItems {
            var x = item as! UITextField
            NSUserDefaults.standardUserDefaults().setValue(x.text, forKey: key)
        }
        
        for (key, item) in numberItems {
            var x = item as! UITextField
            NSUserDefaults.standardUserDefaults().setInteger(x.text.toInt()!, forKey: key)
        }
    }
    
    func restorePrefs() {
        var firstRun : Bool? = !NSUserDefaults.standardUserDefaults().boolForKey("firstrun")
        for (key, item) in boolItems {
            var state : Bool? = NSUserDefaults.standardUserDefaults().boolForKey(key)
            if firstRun! || state == nil {
                state = true
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: key)
                core.data.prefs[key] = true
            }
            //println("bgmusic: \(bgmusicState)")
            item.on = state!
        }
        for (key, item) in stringItems {
            var state : String? = NSUserDefaults.standardUserDefaults().valueForKey(key) as? String
            if firstRun! || state == nil {
                state = ""
                NSUserDefaults.standardUserDefaults().setObject(state, forKey: key)
                core.data.prefs[key] = ""
            }
            //println("bgmusic: \(bgmusicState)")
            var x = item as! UITextField
            x.text = state
        }
        for (key, item) in numberItems {
            var state : Int? = NSUserDefaults.standardUserDefaults().integerForKey(key)
            if firstRun! || state == nil {
                state = 0
                NSUserDefaults.standardUserDefaults().setInteger(state!, forKey: key)
                core.data.prefs[key] = 0
            }
            var x = item as! UISegmentedControl
            x.selectedSegmentIndex = state!
        }
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstrun")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
}


