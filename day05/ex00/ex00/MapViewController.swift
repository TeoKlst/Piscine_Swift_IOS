//
//  MapViewController.swift
//  ex00
//
//  Created by teo KELESTURA on 2019/10/14.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    var initialLocation: Int = 3
    let locationManager = CLLocationManager()
    
//    MAP_OUTLET
    @IBOutlet weak var mapView: MKMapView!
    
//    SEGMENT CONTROL
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .satellite
            default:
                mapView.mapType = .hybrid
        }
    }
    
//     LOCATION_BUTTON
    @IBOutlet weak var locationButton: UIButton!
    @IBAction func currentLocationButtonPress(_ sender: Any) {
        locManager(locationManager)
    }
    
    func locManager(_ manager: CLLocationManager) {
        guard let locValue: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let center = CLLocation(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
        centerMapOnLocation(location: center)
    }
    
    let initialLocationCoords = CLLocation(latitude: 48.896724, longitude: 2.318504)
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    let capeTown = Pin(title: "Cape Town",
      locationName: "South Africa",
      discipline: "Its a Town of Cape",
      coordinate: CLLocationCoordinate2D(latitude: -33.906930, longitude: 18.417554),
      color: .cyan)
    
    let stellenbosh = Pin(title: "Stellenbosh",
      locationName: "Not Cape Town",
      discipline: "Student Town",
      coordinate: CLLocationCoordinate2D(latitude: -33.935000, longitude: 18.857970),
      color: .cyan)
    
    let malmesbury = Pin(title: "Malmesbury",
      locationName: "Out of Cape Town",
      discipline: "Bury of the Malmes",
      coordinate: CLLocationCoordinate2D(latitude: -33.464184, longitude: 18.729956),
      color: .cyan)
    
    let ecole42 = Pin(title: "Ecole 42",
      locationName: "96 Boulevard Bessières, 75017 Paris, France",
      discipline: "Coding School",
      coordinate: CLLocationCoordinate2D(latitude: 48.896724, longitude: 2.318504),
      color: .cyan)
    
    let location = CLLocation()
    
    func setLocationView(initialLoc: Int) {
        print ("InitialLoc \(initialLoc)")
        if (initialLoc == 0) {
            centerMapOnLocation(location: CLLocation(latitude: capeTown.coordinate.latitude, longitude: capeTown.coordinate.longitude))
        }
        else if (initialLoc == 1) {
            centerMapOnLocation(location: CLLocation(latitude: stellenbosh.coordinate.latitude, longitude: stellenbosh.coordinate.longitude))
        }
        else if (initialLoc == 2) {
            centerMapOnLocation(location: CLLocation(latitude: malmesbury.coordinate.latitude, longitude: malmesbury.coordinate.longitude))
        }
        else if (initialLoc == 3) {
            centerMapOnLocation(location: CLLocation(latitude: ecole42.coordinate.latitude, longitude: ecole42.coordinate.longitude))
        }
    }
    
//    VIEW_DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
//        setLocationView(initialLoc: initialLocation)
//        centerMapOnLocation(location: initialLocationCoords)
        mapView.addAnnotation(capeTown)
        mapView.addAnnotation(stellenbosh)
        mapView.addAnnotation(malmesbury)
        mapView.addAnnotation(ecole42)
    }
    
    
//    VIEW_DIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setLocationView(initialLoc: initialLocation)
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
        else {
            //Give pop up error
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case.authorizedWhenInUse:
            mapView.showsUserLocation = true
            break
        case.denied:
            break
        case.notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case.restricted:
            break
        case.authorizedAlways:
            break
        @unknown default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        //
    }
}
