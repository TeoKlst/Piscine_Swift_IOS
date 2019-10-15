//
//  LocationsViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/14.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locations: [Location] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locations = createArray()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func createArray() -> [Location] {
        
        var tempLocations: [Location] = []
        
        let location1 = Location(name: "Cape Town", lat:  -33.906930, long: 18.417554)
        let location2 = Location(name: "Stellenbosh", lat: -33.935000, long: 18.857970)
        let location3 = Location(name: "Malmesbury", lat: -33.464184, long: 18.729956)
        let location4 = Location(name: "Ecole42", lat: 48.896724, long: 2.318504)
        
        tempLocations.append(location1)
        tempLocations.append(location2)
        tempLocations.append(location3)
        tempLocations.append(location4)
        
        return tempLocations
    }
    
    func goToView(row: Int) {
        tabBarController?.selectedIndex = row
    }
}

extension LocationsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locations[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationTableViewCell") as! LocationTableViewCell
        
        cell.setLocation(location: location)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadMapViewScreen(index: indexPath.row)
    }
    
    func loadMapViewScreen(index: Int) {
        let secondTab = self.tabBarController?.viewControllers![1] as! MapViewController
        secondTab.initialLocation = index
        goToView(row: 1)
    }
}
