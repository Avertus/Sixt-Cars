//
//  LumberjackLogger.swift
//  SixtCommon
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import CocoaLumberjackSwift

protocol LoggerProtocol {

    /// Appends the given log message.
    ///
    /// - Parameters:
    ///   - message: Log message.
    func append(_ message: LogMessage)

}

class LumberjackLogger: LoggerProtocol {

    init() {
        DDLog.add(DDTTYLogger.sharedInstance)
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24)
        fileLogger.logFileManager.maximumNumberOfLogFiles = 5
        DDLog.add(fileLogger)
    }

    func append(_ message: LogMessage) {
        switch message.level {
        case .verbose:
            DDLogVerbose(message.description)
        case .debug:
            DDLogDebug(message.description)
        case .info:
            DDLogInfo(message.description)
        case .warning:
            DDLogWarn(message.description)
        case .error, .fatal:
            DDLogError(message.description)
        }
    }

}
