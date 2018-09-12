//
//  PermissionManager.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

protocol PermissionManagerProtocol {

    /// Returns authorization status of the permission type.
    ///
    /// - Parameters:
    ///   - request: Permission type, Camera, Location etc.
    /// - Returns: Authorization status.
    func getAuthorizationStatus() -> Bool

    /// Requests authorization for the given type.
    func requestAuthorization()

}

class PermissionManager: PermissionManagerProtocol {

    var permissionRequestor: PermissionRequestorProtocol

    init(permissionRequestor: PermissionRequestorProtocol) {
        self.permissionRequestor = permissionRequestor
    }

    func getAuthorizationStatus() -> Bool {
        return permissionRequestor.authorizationStatus
    }

    func requestAuthorization() {
        return permissionRequestor.requestAuthorizationIfNeeded()
    }

}
