//
//  LogMessageTests.swift
//  SixtCommonTests
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
@testable import SixtCommon

class LogMessageTests: XCTestCase {

    func test_Description_isCorrect() {
        let message = LogMessage(level: .debug,
                                 message: "Test message",
                                 file: "LogMessageTests",
                                 function: "test_Description_isCorrect",
                                 line: 19)

        XCTAssertEqual(message.description, "LogMessageTests [test_Description_isCorrect:19] Debug: Test message")
    }

    func test_DebugDescription_isCorrect() {
        let message = LogMessage(level: .debug,
                                 message: "Test message",
                                 file: "LogMessageTests",
                                 function: "test_Description_isCorrect",
                                 line: 19)

        XCTAssertEqual(message.debugDescription, "LogMessageTests [test_Description_isCorrect:19] Debug: Test message")
    }

}
