//
//  DataParsers.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

protocol DataParsersProtocol {

    /// Parses into generic object from given JSON data.
    ///
    /// - Parameters:
    ///   - data:           JSON data.
    ///   - successHandler: Closure to be called if parsing completes with success.
    ///   - errorHandler:   Closure to be called if parsing completes with error.
    static func parseJSON<T: Decodable>(data: Data,
                                        successHandler: ((T) -> Void)?,
                                        errorHandler: ((ConnectionError) -> Void)?)

    /// Parses into UIImage from given image data.
    ///
    /// - Parameters:
    ///   - data:           Image data.
    ///   - successHandler: Closure to be called if parsing completes with success.
    ///   - errorHandler:   Closure to be called if parsing completes with error.
    static func parseImage(data: Data,
                           successHandler: ((UIImage) -> Void)?,
                           errorHandler: ((ConnectionError) -> Void)?)

}

class DataParsers: DataParsersProtocol {

    static func parseJSON<T: Decodable>(data: Data,
                                        successHandler: ((T) -> Void)?,
                                        errorHandler: ((ConnectionError) -> Void)?) {
        let decoder = JSONDecoder()
        do {
            let result = try decoder.decode(T.self, from: data)
            successHandler?(result)
        } catch {
            sixtLogger.error("## Error occured while trying to decoding the data.##")
            errorHandler?(ConnectionError.internalError)
        }
    }

    static func parseImage(data: Data,
                           successHandler: ((UIImage) -> Void)?,
                           errorHandler: ((ConnectionError) -> Void)?) {
            guard let image = UIImage(data: data) else {
                sixtLogger.error("## Data cannot be represented as an image. ##")
                errorHandler?(ConnectionError.internalError)
                return
            }
            successHandler?(image)
    }

}
