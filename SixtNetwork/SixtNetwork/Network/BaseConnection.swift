//
//  BaseConnection.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import Alamofire

public protocol BaseConnectionProtocol {

    /// Makes a request to the URL specified.
    ///
    /// - Parameters:
    ///   - url:            The complete target URL.
    ///   - method:         The Http Method (.get, .post, etc)
    ///   - parameters:     The parameters.
    ///   - encoding:       Parameter encoding.
    ///   - headers:        HTTP headers.
    ///   - successHandler: Closure to be called if request completes with success.
    ///   - errorHandler:   Closure to be called if request completes with error.
    // swiftlint:disable function_parameter_count
    func requestData(_ url: URLConvertible,
                     method: HTTPMethod,
                     parameters: [String: Any],
                     encoding: ParameterEncoding,
                     headers: [String: String],
                     successHandler: ((Data) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?)
    // swiftlint:enable function_parameter_count

}

class BaseConnection: BaseConnectionProtocol {

    private let sessionManager: SessionManager
    private let responseQueue = DispatchQueue(label: "de.sixt.SixtCars.BaseConnectionResponseQueue",
        qos: .utility,
        attributes: [.concurrent])

    private static let defaultConnection = BaseConnection(manager: SessionManagerFactory.defaultSession())
    static var `default`: BaseConnectionProtocol {
        return defaultConnection
    }

    init(manager: SessionManager) {
        self.sessionManager = manager
    }

    func requestData(_ url: URLConvertible,
                     method: HTTPMethod,
                     parameters: [String: Any] = [:],
                     encoding: ParameterEncoding = URLEncoding.default,
                     headers: [String: String] = SessionManager.defaultHTTPHeaders,
                     successHandler: ((Data) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?) {
        sixtLogger.info("Starting request: \(url)")
        self.sessionManager.request(url,
                                    method: method,
                                    parameters: parameters,
                                    encoding: encoding,
                                    headers: headers)
            .validate(statusCode: 200..<300)
            .responseData(queue: self.responseQueue) { [weak self] response in
                sixtLogger.debug(response.description)
                guard let strongSelf = self else {
                    sixtLogger.error("## Self reference nil. ##")
                    errorHandler?(ConnectionError.internalError)
                    return
                }
                strongSelf.handleResponse(response, successHandler: successHandler, errorHandler: errorHandler)
        }
    }

    private func handleResponse(_ response: DataResponse<Data>,
                                successHandler: ((Data) -> Void)?,
                                errorHandler: ((ConnectionError) -> Void)?) {
        switch response.result {
        case .failure(let error):
            sixtLogger.error("## Network call error: \(error.localizedDescription) ##")
            guard let httpStatusCode = HttpStatusCode(httpUrlResponse: response.response) else {
                sixtLogger
                    .error("## Failed with status code: \(response.response?.statusCode.description ?? "") ##")
                errorHandler?(ConnectionError.unknownError(error: error))
                return
            }
            errorHandler?(ConnectionError.httpError(statusCode: httpStatusCode))
        case .success(let value):
            successHandler?(value)
        }
    }

}
