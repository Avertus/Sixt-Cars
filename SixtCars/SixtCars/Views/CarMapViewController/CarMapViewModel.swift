//
//  CarMapViewModel.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import CoreLocation
import SixtNetwork

protocol CarMapViewModelProtocol {

    /// Dictionary for car data, holdes Car model for the given "latitude,longitude" key.
    var carMap: [String: CarModel] { get }

    /// Sends request to CodeTalk api to fetch the all car data.
    func fetchCarData()

}

protocol CarMapViewModelDelegate: class {

    /// Called when fetch request for car data completes.
    func addAnnotations()

}

class CarMapViewModel: CarMapViewModelProtocol {

    weak var delegate: CarMapViewModelDelegate?
    var carMap: [String: CarModel] = [:]

    func fetchCarData() {
        AlertManager.instance.showActivityIndicator()
        CodeTalkService.instance.getCarListData(successHandler: { [weak self] cars in
            AlertManager.instance.hideActivityIndicator()
            guard let strongSelf = self else { return }
            let models = cars.map { CarModel($0) }
            for model in models {
                strongSelf.carMap["\(model.location.latitude),\(model.location.longitude)"] = model
            }
            strongSelf.delegate?.addAnnotations()
        }, errorHandler: { error in
                sixtLogger.error(error.description)
                AlertManager.instance.hideActivityIndicator()
                AlertManager.instance.showAlert(titleText: "ErrorTitle".localized, descriptionText: error.description, buttonTitleText: "Ok".localized, completionHandler: nil)
            })
    }

}
