//
//  UrlBuilder.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation

protocol UrlConvertible {

    /// Holdes the URL.
    var url: String { get }
}

protocol UrlBuilderProtocol {

    associatedtype Api

    /// Makes a request to the URL specified.
    ///
    /// - Parameters:
    ///   - for:   Specifies for which Api.
    /// - Returns: Complete URL.
    func buildUrl(for: Api) -> String

}

class UrlBuilder<Api: UrlConvertible>: UrlBuilderProtocol {

    private let baseURL: String

    init(baseUrl: String) {
        self.baseURL = baseUrl
    }

    func buildUrl(for api: Api) -> String {
        return baseURL + api.url
    }
}
