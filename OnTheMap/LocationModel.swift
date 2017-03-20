//
//  LocationModel.swift
//  OnTheMap
//
//  Created by Terrell Robinson on 3/17/17.
//  Copyright © 2017 TKYO. All rights reserved.
//

import MapKit

struct LocationModel {
    
    let latitude: Double
    
    let longitude: Double
    
    let mapString: String
    
    var coordinate: CLLocationCoordinate2D {
        
        return CLLocationCoordinate2DMake(latitude, longitude)
        
    }
    
}
