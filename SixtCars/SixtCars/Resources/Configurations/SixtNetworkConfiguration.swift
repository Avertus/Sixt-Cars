//
//  SixtNetworkConfiguration.swift
//  SixtCars
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import SixtNetwork

class SixtNetworkConfiguration: SixtNetworkConfigurationProtocol {

    var codeTalkBaseUrl: String {
        return "http://www.codetalk.de"
    }

    var driveNowBaseUrl: String {
        return "https://content.drive-now.com"
    }

    var sslPinnedUrls: [String] {
        return ["content.drive-now.com", "de.drive-now.com"]
    }

}
