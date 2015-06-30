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
    var bannerView: GSMobileBannerAdView?
    let greystripeGUID = "51d7ee3c-95fd-48d5-b648-c915209a00a5"
    
    func greystripeBannerDisplayViewController() -> UIViewController {
        return self
    }
    
    @IBOutlet weak var bannerParent: GSBannerAdView!
    @IBAction func fetchInterstitialAd(sender: AnyObject) {
    }
    
    @IBAction func fetchBannerAd(sender: UIButton) {
        toggleFetchingIndicator(bannerActivityIndicator, on: true)
        var size = self.bannerParent.frame.size
        if self.bannerView == nil {
            self.bannerView = GSMobileBannerAdView()
            self.bannerView!.frame = CGRectMake(0, 0, size.width, size.height)
            self.bannerParent.addSubview(self.bannerView!)
        }
    }
    
    @IBOutlet weak var interstitialActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bannerActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.hidden = true
        

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        

    }
    
    func toggleFetchingIndicator(spinner:UIActivityIndicatorView, on:Bool) {
        on ? spinner.startAnimating() : spinner.stopAnimating()
        spinner.hidden = !on
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


