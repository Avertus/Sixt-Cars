//
//  LoggerManager.swift
//  SixtCommon
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import CocoaLumberjackSwift

/// Class that handles logging features.
public final class LoggerManager {

    public static var instance = LoggerManager(LumberjackLogger())
    private var logger: LoggerProtocol!
    private var logLevel: LogLevel = .verbose

    init(_ logger: LoggerProtocol) {
        self.logger = logger
    }

    public func setLogLevel(_ logLevel: LogLevel = .debug) {
        self.logLevel = logLevel
    }

    public func verbose(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .verbose, message: message, file: file, function: function, line: line)
    }

    public func debug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .debug, message: message, file: file, function: function, line: line)
    }

    public func info(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .info, message: message, file: file, function: function, line: line)
    }

    public func warn(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .warning, message: message, file: file, function: function, line: line)
    }

    public func error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .error, message: message, file: file, function: function, line: line)
    }

    public func fatal(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
        log(level: .fatal, message: message, file: file, function: function, line: line)
    }

    private func log(level: LogLevel,
                     message: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        guard level.rawValue >= self.logLevel.rawValue else { return }

        let message = LogMessage(level: level,
            message: message,
            file: shortenFileName(file),
            function: String(describing: function),
            line: line)

        logger.append(message)
    }

    private func shortenFileName(_ fileName: String) -> String {
        var str = String(describing: fileName)
        if let idx = str.range(of: "/", options: .backwards)?.upperBound {
            str = String(str[idx...])
        }
        if let idx = str.range(of: ".", options: .backwards)?.lowerBound {
            str = String(str[..<idx])
        }
        return str
    }

}
