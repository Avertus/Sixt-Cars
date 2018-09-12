//
//  CodeTalkURLBuilder.swift
//  SixtNetwork
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
typealias CodeTalkUrlBuilder = UrlBuilder<CodeTalkApiURL>

/// Enum for CodeTalk api URLs.
enum CodeTalkApiURL: UrlConvertible {

    case getCars

    public var url: String {
        switch self {
        case .getCars:
            return "/cars.json"
        }
    }

}
