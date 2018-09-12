//
//  CarData.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation

/// Response object for getCar.
public struct CarData: Codable {

    public var id: String?
    public var modelIdentifier: String?
    public var modelName: String?
    public var name: String?
    public var make: String?
    public var group: String?
    public var color: String?
    public var series: String?
    public var fuelType: String?
    public var fuelLevel: Double?
    public var transmission: String?
    public var licensePlate: String?
    public var latitude: Double
    public var longitude: Double
    public var innerCleanliness: String?
    public var carImageUrl: String?

    public init(id: String?,
                modelIdentifier: String?,
                modelName: String?,
                name: String?,
                make: String?,
                group: String?,
                color: String?,
                series: String?,
                fuelType: String?,
                fuelLevel: Double?,
                transmission: String?,
                licensePlate: String?,
                latitude: Double,
                longitude: Double,
                innerCleanliness: String?,
                carImageUrl: String?) {
        self.id = id
        self.modelIdentifier = modelIdentifier
        self.modelName = modelName
        self.name = name
        self.make = make
        self.group = group
        self.color = color
        self.series = series
        self.fuelType = fuelType
        self.fuelLevel = fuelLevel
        self.transmission = transmission
        self.licensePlate = licensePlate
        self.latitude = latitude
        self.longitude = longitude
        self.innerCleanliness = innerCleanliness
        self.carImageUrl = carImageUrl
    }

}
