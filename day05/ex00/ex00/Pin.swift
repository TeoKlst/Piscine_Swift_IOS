//
//  Pin.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/14.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import Foundation
import MapKit

class Pin: NSObject, MKAnnotation {
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    let color: UIColor
  
  init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, color: UIColor) {
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate
    self.color = color
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
}
