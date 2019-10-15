//
//  LocationCell.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/14.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import Foundation

class Location {
    var name: String
    var lat: Double
    var long: Double

    init(name: String, lat: Double, long: Double) {
        self.name = name
        self.lat = lat
        self.long = long
    }
}
