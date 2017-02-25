//
//  RestaurantListViewController.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/21/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import UIKit

class RestaurantListViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!;

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension RestaurantListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurantListCell", for: indexPath);
        return cell;
    }
}
