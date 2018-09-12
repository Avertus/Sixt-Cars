//
//  SessionManagerFactoryTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
import Alamofire
@testable import SixtNetwork

class SessionManagerFactoryTests: XCTestCase {

    func test_DefaultSession_NotNil() {
        let sessionManager = SessionManagerFactory.defaultSession()

        XCTAssertNotNil(sessionManager)
    }

}
