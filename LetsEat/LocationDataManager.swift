//
//  LocationDataManager.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/22/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import Foundation

class LocationDataManager {
    fileprivate let arrLocations = ["Aspen", "Boston", "Charleston", "Chicago", "Houston", "Las Vegas", "Los Angeles", "Miami", "New Orleans", "New York", "Philadelphia", "Portland", "San Antonio", "San Francisco", "Washington District of Columbia"]
    
    func fetch() -> [String] {
        return arrLocations
    }
}
