//
//  Location.swift
//  LetsEat
//
//  Created by Rodney Coleman on 2/22/17.
//  Copyright © 2017 Rodney Coleman. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let locations: [String] = {
        var locationManager = LocationDataManager()
        return locationManager.fetch()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LocationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as UITableViewCell!
        
        cell?.textLabel?.text = locations[indexPath.row]
        
        return cell!
    }
}
