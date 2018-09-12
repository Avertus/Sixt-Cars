//
//  CodeTalkService.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import SixtNetwork

protocol CodeTalkServiceProtocol {

    /// Requests car list from the api.
    ///
    /// - Parameters:
    ///   - successHandler: Closure to be called if request with success.
    ///   - errorHandler:   Closure to be called if request completes with error.
    func getCarListData(successHandler: (([CarData]) -> Void)?,
                        errorHandler: ((ConnectionError) -> Void)?)

}

class CodeTalkService: CodeTalkServiceProtocol {

    static let instance = CodeTalkService(codeTalkApi: CodeTalkApi())
    private let codeTalkApi: CodeTalkApiProtocol!

    init(codeTalkApi: CodeTalkApiProtocol) {
        self.codeTalkApi = codeTalkApi
    }

    func getCarListData(successHandler: (([CarData]) -> Void)?,
                        errorHandler: ((ConnectionError) -> Void)?) {
        codeTalkApi.getCarListData(successHandler: successHandler, errorHandler: errorHandler)
    }

}
