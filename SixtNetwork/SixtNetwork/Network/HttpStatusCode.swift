//
//  HttpStatusCode.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation

public enum ConnectionError: Error, CustomStringConvertible {
    case internalError
    case httpError(statusCode: HttpStatusCode)
    case unknownError(error: Error)
    case emptyData

    public var description: String {
        switch self {
        case .internalError:
            return "Internal Error"
        case .httpError(let statusCode):
            return "HTTP Error with status Code: \(statusCode)"
        case .unknownError(let error):
            return "\(error.localizedDescription)"
        case .emptyData:
            return "Empty Data Error"
        }
    }
}

public enum HttpStatusCode: Int {

    case ok = 200
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case conflict = 409
    case imATeapot = 418
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503

    init?(httpUrlResponse: HTTPURLResponse?) {
        if let httpResponse = httpUrlResponse {
            self.init(rawValue: httpResponse.statusCode)
        } else {
            return nil
        }
    }

    /// Returns true if the StatusCode is any kind of HTTP Error Code
    var isErrorCode: Bool {
        return (isClientErrorCode || isServerErrorCode)
    }

    /// Returns true if the StatusCode is any kind of Client HTTP Error Code
    var isClientErrorCode: Bool {
        return (400...499).contains(rawValue)
    }

    /// Returns true if the StatusCode is any kind of Server HTTP Error Code
    var isServerErrorCode: Bool {
        return (500...599).contains(rawValue)
    }
}
