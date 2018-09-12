//
//  MockLogger.swift
//  SixtCommonTests
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
@testable import SixtCommon

class MockLogger: LoggerProtocol {

    var messages: [LogMessage] = []

    func append(_ message: LogMessage) {
        messages.append(message)
    }

}
