//
//  Facebook_OTM.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class Facebook_OTM {
    
    // MARK: Properties
    
    private let fbLoginManager = FBSDKLoginManager()
    
    // MARK: Singleton Instance
    
    private static var sharedInstance = Facebook_OTM()
    
    class func sharedManager() -> Facebook_OTM {
        
        return sharedInstance
        
    }
    
    // MARK: Access Token
    
    func currentAccessToken() -> FBSDKAccessToken! {
        
        return FBSDKAccessToken.current()
        
    }
    
    // MARK: Logout
    
    func logout() {
        
        fbLoginManager.logOut()
        
    }
}
