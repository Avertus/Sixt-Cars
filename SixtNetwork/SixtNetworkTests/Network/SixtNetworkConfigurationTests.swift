//
//  SixtNetworkConfigurationTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
@testable import SixtNetwork

class SixtNetworkConfigurationTests: XCTestCase {

    func test_ConfigurationInitial_Nil() {
        XCTAssertNil(sixtNetworkConfiguration)
    }

    func test_Configure_Success() {
        configure(MockSixtConfiguration())

        XCTAssertNotNil(sixtNetworkConfiguration)
        XCTAssertEqual(sixtNetworkConfiguration?.codeTalkBaseUrl, "http://test.com")
        XCTAssertEqual(sixtNetworkConfiguration?.driveNowBaseUrl, "https://test.test.com")
        XCTAssertEqual(sixtNetworkConfiguration?.sslPinnedUrls.count, 2)
        XCTAssertEqual(sixtNetworkConfiguration?.sslPinnedUrls[0], "test.test.com")
        XCTAssertEqual(sixtNetworkConfiguration?.sslPinnedUrls[1], "test.com")
    }

}
