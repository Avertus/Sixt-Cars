//
//  DriveNowService.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import SixtNetwork

protocol DriveNowServiceProtocol {

    /// Requests car image for the given parameters from the api.
    ///
    /// - Parameters:
    ///   - carData:          Requested car.
    ///   - successHandler:   Closure to be called if request with success.
    ///   - errorHandler:     Closure to be called if request completes with error.
    func getCarImage(carData: CarData,
                     successHandler: ((UIImage) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?)

}

class DriveNowService: DriveNowServiceProtocol {

    static let instance = DriveNowService(driveNowApi: DriveNowApi())
    private let driveNowApi: DriveNowApiProtocol!

    init(driveNowApi: DriveNowApiProtocol) {
        self.driveNowApi = driveNowApi
    }

    func getCarImage(carData: CarData,
                     successHandler: ((UIImage) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?) {
        guard let modelIdentifier = carData.modelIdentifier,
            let color = carData.color,
            let fallBackImageURL = carData.carImageUrl else {
                errorHandler?(ConnectionError.internalError)
                return
        }
        driveNowApi.getCarImage(modelIdentifier: modelIdentifier,
                                color: color,
                                fallBackImageURL: fallBackImageURL,
                                successHandler: successHandler,
                                errorHandler: errorHandler)
    }

}
