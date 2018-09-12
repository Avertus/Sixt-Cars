//
//  LocationPermissionRequestor.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class LocationPermissionRequestor: PermissionRequestorProtocol {

    var authorizationStatus: Bool {
        let authorizationStatus = CoreLocationManager.instance.authorizationStatus
        return authorizationStatus == .authorizedAlways || authorizationStatus == .authorizedWhenInUse
    }

    func requestAuthorizationIfNeeded() {
        switch CoreLocationManager.instance.authorizationStatus {
        case .notDetermined:
            CoreLocationManager.instance.requestAuthorization()
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            break
        default:
            showAlert()
        }
    }

    private func showAlert() {
        AlertManager.instance.showAlert(titleText: "LocationPermissionTitle".localized,
            descriptionText: "LocationPermissionBody".localized,
            buttonTitleText: "Ok".localized) { [weak self] in
            guard let strongSelf = self else { return }
                strongSelf.redirectToSettings() }
    }

}
