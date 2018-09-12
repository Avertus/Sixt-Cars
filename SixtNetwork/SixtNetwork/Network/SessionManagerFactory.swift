//
//  SessionManagerFactory.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 8.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import Alamofire

protocol SessionManagerFactoryProtocol {

    /// Returns Alamofire Session Manager with the custome Sixt Network configurations, before calling SixtNetworkConfiguration must be configured.
    ///
    /// - returns:  The configured Alamofire SessionManager.
    static func defaultSession() -> SessionManager

}

class SessionManagerFactory: SessionManagerFactoryProtocol {

    private static var sessionManager: SessionManager?

    static func defaultSession() -> SessionManager {
        if let manager = sessionManager {
            return manager
        }
        let manager = Alamofire.SessionManager(
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(
                policies: serverTrustPolicies
            )
        )
        if sixtNetworkConfiguration != nil {
            sessionManager = manager
        }
        return manager
    }

    private static var serverTrustPolicies: [String: ServerTrustPolicy] {
        var policies = [String: ServerTrustPolicy]()
        guard let configuration = sixtNetworkConfiguration else {
            sixtLogger.fatal("#### Sixt Network is not configured. ####")
            return [:]
        }

        configuration.sslPinnedUrls.forEach { url in
            policies[url] = .pinCertificates(
                certificates: ServerTrustPolicy.certificates(),
                validateCertificateChain: true,
                validateHost: true
            )
        }
        return policies
    }

    private static let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        let cookiesConfiguration = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        configuration.httpCookieStorage = cookiesConfiguration
        configuration.httpCookieAcceptPolicy = HTTPCookie.AcceptPolicy.always
        configuration.urlCache = nil

        return configuration
    }()

}
