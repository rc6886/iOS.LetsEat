//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/21/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import Foundation

class ExploreDataManager: DataManager {
    fileprivate var items: [ExploreItem] = [];
    
    func fetch() {
        for data in load(file: "ExploreData") {
            items.append(ExploreItem(dict: data));
        }
    }
    
    func numberOfItems() -> Int {
        return items.count;
    }
    
    func explore(at index: IndexPath) -> ExploreItem {
        return items[index.item];
    }
}
