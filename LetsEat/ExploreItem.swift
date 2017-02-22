//
//  ExploreItem.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/21/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import Foundation

struct ExploreItem {
    var name: String?
    var image: String?
}

extension ExploreItem {
    init(dict: [String: AnyObject]) {
        self.name = dict["name"] as? String;
        self.image = dict["image"] as? String;
    }
}
