//
//  StudentModel.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

struct StudentModel {
    
    let uniqueKey: String
    let firstName: String
    let lastName: String
    var mediaURL: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(uniqueKey: String, firstName: String, lastName: String, mediaURL: String) {
        self.uniqueKey = uniqueKey
        self.firstName = firstName
        self.lastName = lastName
        self.mediaURL = mediaURL
    }
    
}
