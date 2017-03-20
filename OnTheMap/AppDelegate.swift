//
//  AppDelegate.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

import UIKit
import FBSDKLoginKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //MARK: Properties
    
    var window: UIWindow?
    
    //MARK: UIApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKSettings.setAppURLSchemeSuffix(AppConstants.facebookLogin.URLSuffix)
        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
        FBSDKAppEvents.activateApp()
        
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if url.scheme == AppConstants.facebookLogin.URLScheme {
            
            return FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
            
        } else {
            
            return true
            
        }
    }
}
