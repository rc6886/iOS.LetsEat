//
//  DataManager.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/24/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import Foundation

class DataManager {
    func load(file name: String) -> [[String:AnyObject]] {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let items = NSArray(contentsOfFile: path) else { return [[:]] }
        
        return items as! [[String : AnyObject]]
    }
}
