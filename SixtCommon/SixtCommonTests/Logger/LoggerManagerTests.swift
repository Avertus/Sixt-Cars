//
//  LoggerManagerTests.swift
//  SixtCommonTests
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
@testable import SixtCommon

class LoggerManagerTests: XCTestCase {

    var mockLogger: MockLogger!
    var loggerManager: LoggerManager!

    override func setUp() {
        mockLogger = MockLogger()
        loggerManager = LoggerManager(mockLogger)
    }

    func test_LogLevelInitial_isVerbose() {
        loggerManager.verbose("Verbose message.")

        XCTAssertEqual(mockLogger.messages.count, 1)
        XCTAssertEqual(mockLogger.messages[0].description,
                       "LoggerManagerTests [test_LogLevelInitial_isVerbose():23] Verbose: Verbose message.")
    }

    func test_LogLevelDebug_isEmpty() {
        loggerManager.setLogLevel(.debug)
        loggerManager.verbose("Verbose message.")

        XCTAssertEqual(mockLogger.messages.count, 0)
    }

    func test_LogLevelDebug_SomeLogs() {
        loggerManager.setLogLevel(.debug)
        loggerManager.debug("Debug message.")
        loggerManager.fatal("Fatal message.")
        loggerManager.info("Info message.")

        XCTAssertEqual(mockLogger.messages.count, 3)
        XCTAssertEqual(mockLogger.messages[0].description,
                       "LoggerManagerTests [test_LogLevelDebug_SomeLogs():39] Debug: Debug message.")
        XCTAssertEqual(mockLogger.messages[1].description,
                       "LoggerManagerTests [test_LogLevelDebug_SomeLogs():40] Fatal: Fatal message.")
        XCTAssertEqual(mockLogger.messages[2].description,
                       "LoggerManagerTests [test_LogLevelDebug_SomeLogs():41] Info: Info message.")
    }

}
