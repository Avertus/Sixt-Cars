//
//  MockBaseConnection.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import Alamofire
@testable import SixtNetwork

class MockBaseConnection: BaseConnectionProtocol {

    var isSuccess = true
    var successValue: Data?
    var errorValue: ConnectionError?

    // swiftlint:disable function_parameter_count
    func requestData(_ url: URLConvertible,
                     method: HTTPMethod,
                     parameters: [String: Any],
                     encoding: ParameterEncoding,
                     headers: [String: String],
                     successHandler: ((Data) -> Void)?,
                     errorHandler: ((ConnectionError) -> Void)?) {

        if isSuccess, let data = successValue {
            successHandler?(data)
        } else if let error = errorValue {
            errorHandler?(error)
        }
    }
    // swiftlint:enable function_parameter_count

}
