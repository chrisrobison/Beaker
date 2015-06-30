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

class BeakerViewController: UIViewController, GSAdDelegate {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var bannerView: GSMobileBannerAdView?
    var fullscreenAd: GSFullscreenAd?
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var serverLabel: UILabel!
    @IBOutlet weak var bannerButton: UIButton!
    @IBOutlet weak var interstitialButton: UIButton!
    @IBOutlet weak var interstitialActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bannerActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var bannerParent: GSBannerAdView!
    @IBAction func fetchInterstitialAd(sender: UIButton) {
        println("button title: \(sender.titleLabel)")
        if sender.titleLabel!.text != "Display" {
            fetchFullScreenAd()
        } else {
            displayFullScreenAd()
        }
    }
    
    @IBAction func fetchBannerAd(sender: UIButton) {
        toggleFetchingIndicator(bannerActivityIndicator, on: true)
        var size = self.bannerParent.frame.size
        if self.bannerView == nil {
            self.bannerView = GSMobileBannerAdView(delegate: self)
            self.bannerView!.frame = CGRectMake(0, 0, size.width, size.height)
            self.bannerParent.addSubview(self.bannerView!)
        }
    }
    

    @IBOutlet weak var adID: UILabel!
    /**
    * Sent when an ad has successfully been fetched and is ready to be displayed.
    *
    * @param a_ad The ad that succeeded.
    */
    func greystripeAdFetchSucceeded(ad:GSAd) {
        toggleFetchingIndicator(bannerActivityIndicator, on: false)
        toggleFetchingIndicator(interstitialActivityIndicator, on: false)
        adID.text = "Ad ID: \(ad.adID())"
        adID.hidden = false
        println("Ad fetch succeeded \(ad.adID())")
        
        if ad.isEqual(fullscreenAd) {
            interstitialButton.setTitle("Display", forState: .Normal)
        }
    }
   
    
    /**
    * Sent if the ad fetch request failed.
    *
    * @param a_ad The ad that failed.
    * @param a_error The error that occured during fetching.
    */
    func greystripeAdFetchFailed(ad:GSAd, error:GSAdError) {
        
    }
    
    /**
    * Sent when the ad is clicked through to the browser or to an external app.
    *
    * @param a_ad The ad that clicked through.
    */
    func greystripeAdClickedThrough(ad:GSAd) {
    
    }
    
    /**
    * Sent when a fullscreen ad is about to take over the screen, or when the browser
    * is about to present modally for banner ads.
    */
    func greystripeWillPresentModalViewController() {
    
    }
    
    /**
    * Sent when the fullscreen ad's view controller or the browser view controller
    * is about to animate off screen. If a view controller needs to be pushed or
    * popped when the ad is dismissed, it should be done here.
    */
    func greystripeWillDismissModalViewController() {
    
    }
    
    /**
    * Sent after the fullscreen ad's view controller or the browser view controller
    * has fully animated off screen. If the app wants to present a modal view controller after
    * an ad has been dismissed, it must be done in this method. Modal presentation will not work
    * from the greystripeWillDismissModalViewController method.
    */
    func greystripeDidDismissModalViewController() {
    
    }
    
    /**
    * Sent when a banner ad's view is about to expand to take over the
    * full screen.
    */
    func greystripeBannerWillExpand() {
    
    }
    
    /**
    * Sent when a banner ad's view is about to resize.
    *
    * @param newPosition The new position of the ad relative to the interface's origin.
    */
    func greystripeBannerWillResize(newPosition:CGRect) {
        
    }
    
    /**
    * Sent after an expanded or resized banner ad has collapsed back to it's normal
    * size. 
    */
    func greystripeBannerDidCollapse() {
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.navigationBar.hidden = true
        
        // Replace these with references to config
        serverLabel.text = "Cobalt [Production]"
        appNameLabel.text = "CNVR Ops iOS Test App"
        fullscreenAd = GSFullscreenAd(delegate: self)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        
        self.navigationController?.automaticallyAdjustsScrollViewInsets = false
        

    }
    
    func greystripeGUID() -> String {
        return "51d7ee3c-95fd-48d5-b648-c915209a00a5"
    }
    
    func greystripeBannerDisplayViewController() -> UIViewController {
        return self
    }
    
    func fetchFullScreenAd() {
        if !fullscreenAd!.isAdReady() {
            toggleFetchingIndicator(interstitialActivityIndicator, on: true)
            fullscreenAd?.fetch()
        }
    }
    
    func displayFullScreenAd() {
        fullscreenAd?.displayFromViewController(self)
        interstitialButton.setTitle("Fetch Ad", forState: .Normal)
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


