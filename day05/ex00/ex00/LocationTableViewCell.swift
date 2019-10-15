//
//  LocationTableViewCell.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/14.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    
    func setLocation(location: Location) {
        locationLabel.text = location.name
    }
}
