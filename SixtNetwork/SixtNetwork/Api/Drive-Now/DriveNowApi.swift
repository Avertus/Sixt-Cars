//
//  DriveNowApi.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public protocol DriveNowApiProtocol {

    /// Requests car image for the given parameters.
    ///
    /// - Parameters:
    ///   - modelIdentifier:  ModelIdentifier property of the given car.
    ///   - color:            Color property of the given car.
    ///   - fallBackImageURL: If request fails and there is a fallback image url for that car, this url will be requested as a backup.
    ///   - successHandler:   Closure to be called if request with success.
    ///   - errorHandler:     Closure to be called if request completes with error.
    func getCarImage(modelIdentifier: String,
                     color: String,
                     fallBackImageURL: String?,
                     successHandler: ((UIImage) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?)

}

public class DriveNowApi: DriveNowApiProtocol {

    private let urlBuilder: DriveNowUrlBuilder
    private let connection: BaseConnectionProtocol

    public convenience init() {
        self.init(connection: BaseConnection.default)
    }

    init(connection: BaseConnectionProtocol) {
        self.connection = connection
        self.urlBuilder = DriveNowUrlBuilder(baseUrl: sixtNetworkConfiguration?.driveNowBaseUrl ?? "")
    }

    public func getCarImage(modelIdentifier: String,
                            color: String,
                            fallBackImageURL: String?,
                            successHandler: ((UIImage) -> Void)?,
                            errorHandler: ((ConnectionError) -> Void)?) {
        let url = urlBuilder.buildUrl(for: .getCarImage(modelIdentifier, color))

        connection.requestData(url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: SessionManager.defaultHTTPHeaders,
            successHandler: { data in
                DataParsers.parseImage(data: data,
                    successHandler: successHandler,
                    errorHandler: errorHandler)
            },
            errorHandler: { [weak self] error in
                if let fallbackURL = fallBackImageURL {
                    guard let strongSelf = self else {
                        errorHandler?(error)
                        return }
                    strongSelf.connection.requestData(fallbackURL,
                        method: .get,
                        parameters: [:],
                        encoding: URLEncoding.default,
                        headers: SessionManager.defaultHTTPHeaders,
                        successHandler: { data in
                            DataParsers.parseImage(data: data,
                                successHandler: successHandler,
                                errorHandler: errorHandler)
                        },
                        errorHandler: errorHandler)
                } else {
                    errorHandler?(error)
                }
            })
    }

}
