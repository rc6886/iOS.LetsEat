//
//  RestaurantAnnotation.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/24/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import UIKit
import MapKit

class RestaurantAnnotation: NSObject, MKAnnotation {
    var name: String?
    var cuisines: [String] = []
    var latitude: Double?
    var longitude: Double?
    var address: String?
    var postalCode: String?
    var state: String?
    var imageUrl: String?
    
    init(dict: [String: AnyObject]) {
        if let lat = dict["lat"] as? Double { self.latitude = lat }
        if let long = dict["lng"] as? Double { self.longitude = long }
        if let name = dict["name"] as? String { self.name = name }
        if let cuisines = dict["cuisines"] as? [String] { self.cuisines = cuisines }
        if let address = dict["address"] as? String { self.address = address }
        if let postalCode = dict["postal_code"] as? String { self.postalCode = postalCode }
        if let state = dict["state"] as? String { self.state = state }
        if let image = dict["image_url"] as? String { self.imageUrl = image }
    }
    
    var coordinate: CLLocationCoordinate2D {
        guard let lat = latitude, let long = longitude else { return CLLocationCoordinate2D() }
        return CLLocationCoordinate2D(latitude: lat, longitude: long)
    }
    
    var subtitle: String? {
        if cuisines.isEmpty { return "" }
        else if cuisines.count == 1 { return cuisines.first }
        else { return cuisines.joined(separator: ", ") }
    }
    
    var title: String? {
        return name
    }
}
