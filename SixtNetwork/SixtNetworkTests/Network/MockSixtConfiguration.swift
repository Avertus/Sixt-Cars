//
//  MockSixtConfiguration.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
@testable import SixtNetwork

class MockSixtConfiguration: SixtNetworkConfigurationProtocol {

    var codeTalkBaseUrl: String {
        return "http://test.com"
    }

    var driveNowBaseUrl: String {
        return "https://test.test.com"
    }

    var sslPinnedUrls: [String] {
        return ["test.test.com",
                "test.com"]
    }

}
