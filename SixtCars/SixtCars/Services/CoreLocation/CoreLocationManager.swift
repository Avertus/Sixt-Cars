//
//  CoreLocationManager.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol CoreLocationManagerProtocol {

    /// Authorization status value.
    var authorizationStatus: CLAuthorizationStatus { get }

    /// User location value.
    var userLocation: CLLocation? { get }

    /// Make location authorization request to the user.
    func requestAuthorization()

    /// Starts fetching location.
    func startUpdatingLocation()

}

class CoreLocationManager: NSObject, CoreLocationManagerProtocol {

    static var instance: CoreLocationManager = CoreLocationManager()
    private let locationManager = CLLocationManager()

    var authorizationStatus: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }

    var userLocation: CLLocation?

    private override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLLocationAccuracyHundredMeters
    }

    func requestAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }

    func startUpdatingLocation() {
        self.locationManager.startUpdatingLocation()
    }

}

extension CoreLocationManager: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.first
    }

}
