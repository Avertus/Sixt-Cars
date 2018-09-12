//
//  LogMessage.swift
//  SixtCommon
//
//  Created by Deniz Gultek on 9.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

/// Enum for Logging levels.
public enum LogLevel: Int, CustomStringConvertible {

    case verbose = 0
    case debug = 1
    case info = 2
    case warning = 3
    case error = 4
    case fatal = 5

    public var description: String {
        switch self {
        case .verbose:
            return "Verbose"
        case .debug:
            return "Debug"
        case .info:
            return "Info"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        case .fatal:
            return "Fatal"
        }
    }

}

/// Object that holdes and concats log message properties.
struct LogMessage: CustomStringConvertible, CustomDebugStringConvertible {

    public let level: LogLevel
    public let message: String
    public let file: String
    public let function: String
    public let line: Int

    public var description: String {
        return "\(file) [\(function):\(line)] \(level.description): \(message)"
    }

    public var debugDescription: String {
        return self.description
    }

}
