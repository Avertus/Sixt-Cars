//
//  DriveNowURLBuilder.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
typealias DriveNowUrlBuilder = UrlBuilder<DriveNowApiURL>

/// Enum for DriveNow api URLs.
enum DriveNowApiURL: UrlConvertible {

    case getCarImage(String, String)

    var url: String {
        switch self {
        case .getCarImage(let modelIdentifier, let color):
            return "/sites/default/files/cars/3x/\(modelIdentifier)/\(color).png"
        }
    }

}
