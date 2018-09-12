//
//  HttpStatusCodeTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
@testable import SixtNetwork

class HttpStatusCodeTest: XCTestCase {

    func testHttpCodeForbiddenIsClientErrorCode() {
        let httpCode = HttpStatusCode.forbidden
        XCTAssertTrue(httpCode.isErrorCode)
        XCTAssertTrue(httpCode.isClientErrorCode)
        XCTAssertFalse(httpCode.isServerErrorCode)
    }

    func testHttpCodeBadGatewayIsServerErrorCode() {
        let httpCode = HttpStatusCode.badGateway
        XCTAssertTrue(httpCode.isErrorCode)
        XCTAssertFalse(httpCode.isClientErrorCode)
        XCTAssertTrue(httpCode.isServerErrorCode)
    }

}
