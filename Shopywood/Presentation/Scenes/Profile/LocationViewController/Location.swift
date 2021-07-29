//
//  Location.swift
//  Shopywood
//
//  Created by CodergirlTM on 25.07.21.
//

import UIKit
import MapKit

class LocationClass {
    
    var address:NSString
    var latitude:NSNumber
    var longitude:NSNumber

    
    init() {
        address = "" as NSString
        latitude = 0
        longitude = 0
    }
    
    init(address:NSString, latitude:NSNumber, longitude:NSNumber) {
        self.address = address
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func setAddress(_ place: CLPlacemark) {
        var text = ""
        var locality = place.locality ?? ""
        var thoroughfare = place.thoroughfare ?? ""
        var subThoroughfare = place.subThoroughfare ?? ""
        
        if subThoroughfare == "" && thoroughfare == "" && locality == "" {
            address = place.country as NSString? ?? "No country or address found"
            return
        }
        
        if locality         != "" { locality += " " }
        if thoroughfare     != "" { thoroughfare += " " }
        if subThoroughfare  != "" { subThoroughfare += " " }
        
        text = "\(subThoroughfare)\(thoroughfare)\(locality)"
        address = text as NSString
    }
    
    // Saves coordinates for location
    func setCoordinate(_ location:CLLocation) {
        latitude = location.coordinate.latitude as Double as NSNumber
        longitude = location.coordinate.longitude as Double as NSNumber
    }
}

