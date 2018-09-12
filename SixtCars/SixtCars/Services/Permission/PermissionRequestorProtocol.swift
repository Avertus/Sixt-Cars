//
//  PermissionRequestorProtocol.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

protocol PermissionRequestorProtocol {

    /// Authorization status value.
    var authorizationStatus: Bool { get }

    /// Request authorization if needed.
    func requestAuthorizationIfNeeded()

    /// If user already gave an answer to request before, redirect to settings app, since we can not show Apple alert anymore.
    func redirectToSettings()

}

extension PermissionRequestorProtocol {

    func redirectToSettings() {
        guard let settingsUrl = URL(string: UIApplicationOpenSettingsURLString) else {
            return
        }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }
    }

}
