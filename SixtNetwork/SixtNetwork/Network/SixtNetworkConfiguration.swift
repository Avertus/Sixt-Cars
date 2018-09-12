//
//  SixtNetworkConfiguration.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import SixtCommon

/// Global variable of logger.
let sixtLogger = LoggerManager.instance

/// Global variable of network configuration.
var sixtNetworkConfiguration: SixtNetworkConfigurationProtocol?

/// Global method for configuring network configuration.
///
/// - Parameters:
///   - config:     Network configuration that will be used.
public func configure(_ config: SixtNetworkConfigurationProtocol) {
    sixtNetworkConfiguration = config
}

public protocol SixtNetworkConfigurationProtocol {

    /// Base URL of CodeTalk api.
    var codeTalkBaseUrl: String { get }

    /// Base URL of DriveNow api.
    var driveNowBaseUrl: String { get }

    /// SSL pinned Urls, in order to prevent MITM attacks. If a URL is present, then it's certificate must be found in the bundle as well.
    var sslPinnedUrls: [String] { get }

}
