//
//  CarModel.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import CoreLocation
import SixtNetwork
import UIKit

class CarModel {

    let location: CLLocationCoordinate2D
    let id: String
    let modelIdentifier: String
    let modelName: String
    let name: String
    let make: String
    let group: String
    let color: String
    let series: String
    let fuelType: String
    let fuelLevel: Double
    let transmission: String
    let licensePlate: String
    let innerCleanliness: String
    var carImage: UIImageView?
    var imageSetHandler: (() -> Void)?

    init(_ carData: CarData) {
        self.location = CLLocationCoordinate2D(latitude: carData.latitude, longitude: carData.longitude)
        self.id = carData.id ?? ""
        self.modelIdentifier = carData.modelIdentifier ?? ""
        self.modelName = carData.modelName ?? ""
        self.name = carData.name ?? ""
        self.make = carData.make ?? ""
        self.group = carData.group ?? ""
        self.color = carData.color ?? ""
        self.series = carData.series ?? ""
        self.fuelType = carData.fuelType ?? ""
        self.fuelLevel = carData.fuelLevel ?? 0.0
        self.transmission = carData.transmission ?? ""
        self.licensePlate = carData.licensePlate ?? ""
        self.innerCleanliness = carData.innerCleanliness ?? ""
        DispatchQueue.main.async {
            self.carImage = UIImageView()
            self.carImage?.loadCarImage(carData, imageSetHandler: self.imageSetHandler)
        }
    }

}
