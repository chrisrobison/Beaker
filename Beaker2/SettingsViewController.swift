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
        
        boolItems = ["GPSSwitch":GPSSwitch, "fetchMIDSwitch":fetchMIDSwitch, "overrideGeotargeting":overrideGeotargeting, "overrideBudgetCap": overrideBudgetCap, "overrideFrequencyCap": overrideFrequencyCap, "spoofIPSwitch": spoofIPSwitch]
        stringItems = ["serverLabel":serverLabel, "serverDetail": serverDetail, "appLabel": appLabel, "appDetail": appDetail, "spoofIPInput": spoofIPInput, "MIDTextInput": MIDTextInput]
        numberItems = ["serverMode": serverMode]
        // Do any additional setup after loading the view, typically from a nib.
        //        var ad = GSSDKInfo()
        var ad = GSAdModel()
        
        var test = GSBannerAdView()
        
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
        
    }
    
    func restorePrefs() {
        
    }
    
}


