//
//  CodeTalkApi.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import Alamofire

public protocol CodeTalkApiProtocol {

    /// Requests car list from the api.
    ///
    /// - Parameters:
    ///   - successHandler: Closure to be called if request with success.
    ///   - errorHandler:   Closure to be called if request completes with error.
    func getCarListData(successHandler: (([CarData]) -> Void)?,
                        errorHandler: ((ConnectionError) -> Void)?)

}

public class CodeTalkApi: CodeTalkApiProtocol {

    private let urlBuilder: CodeTalkUrlBuilder
    private let connection: BaseConnectionProtocol

    public convenience init() {
        self.init(connection: BaseConnection.default)
    }

    public init(connection: BaseConnectionProtocol) {
        self.connection = connection
        self.urlBuilder = CodeTalkUrlBuilder(baseUrl: sixtNetworkConfiguration?.codeTalkBaseUrl ?? "")
    }

    public func getCarListData(successHandler: (([CarData]) -> Void)?,
                               errorHandler: ((ConnectionError) -> Void)?) {
        let url = urlBuilder.buildUrl(for: .getCars)

        connection.requestData(url,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: SessionManager.defaultHTTPHeaders,
            successHandler: { data in
                DataParsers.parseJSON(data: data,
                    successHandler: successHandler,
                    errorHandler: errorHandler)
            },
            errorHandler: errorHandler)
    }

}
