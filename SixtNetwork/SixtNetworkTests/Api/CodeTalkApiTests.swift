//
//  CodeTalkApiTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import XCTest
@testable import SixtNetwork

class CodeTalkApiTests: XCTestCase {

    var codeTalkApi: CodeTalkApi!
    var mockBaseConnection: MockBaseConnection!

    override func setUp() {
        mockBaseConnection = MockBaseConnection()
        codeTalkApi = CodeTalkApi(connection: mockBaseConnection)
    }

    func test_GetCarListData_ConnectionError() {
        mockBaseConnection.errorValue = ConnectionError.httpError(statusCode: HttpStatusCode.imATeapot)
        mockBaseConnection.isSuccess = false

        var errorDescription: String?

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: (([CarData]) -> Void)? = { carList in
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            errorDescription = error.description
            parsedExpectation.fulfill()
        }
        codeTalkApi.getCarListData(successHandler: successHandler, errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(errorDescription!, "HTTP Error with status Code: imATeapot")
    }

    // swiftlint:disable function_body_length
    func test_GetCarListData_Success() {
        let carData = CarData(id: "WMWSW31030T222518",
                              modelIdentifier: "mini",
                              modelName: "MINI",
                              name: "Vanessa",
                              make: "BMW",
                              group: "MINI",
                              color: "midnight_black",
                              series: "MINI",
                              fuelType: "D",
                              fuelLevel: 0.7,
                              transmission: "M",
                              licensePlate: "M-VO0259",
                              latitude: 48.134557,
                              longitude: 11.576921,
                              innerCleanliness: "REGULAR",
                              carImageUrl: "https://de.drive-now.com/static/drivenow/img/cars/mini.png")

        let carList = [carData, carData]
        // swiftlint:disable force_try
        let jsonData = try! JSONEncoder().encode(carList)
        // swiftlint:enable force_try

        mockBaseConnection.successValue = jsonData
        mockBaseConnection.isSuccess = true
        var result: [CarData] = []

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: (([CarData]) -> Void)? = { carList in
            result = carList
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            parsedExpectation.fulfill()
        }

        codeTalkApi.getCarListData(successHandler: successHandler, errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[1].id, "WMWSW31030T222518")
        XCTAssertEqual(result[1].modelIdentifier, "mini")
        XCTAssertEqual(result[1].modelName, "MINI")
        XCTAssertEqual(result[1].name, "Vanessa")
        XCTAssertEqual(result[1].make, "BMW")
        XCTAssertEqual(result[1].group, "MINI")
        XCTAssertEqual(result[1].color, "midnight_black")
        XCTAssertEqual(result[1].series, "MINI")
        XCTAssertEqual(result[1].fuelType, "D")
        XCTAssertEqual(result[1].transmission, "M")
        XCTAssertEqual(result[1].licensePlate, "M-VO0259")
        XCTAssertEqual(result[1].licensePlate, "M-VO0259")
        XCTAssertEqual(result[1].licensePlate, "M-VO0259")
        XCTAssertEqual(result[1].latitude, 48.134557)
        XCTAssertEqual(result[1].longitude, 11.576921)
        XCTAssertEqual(result[1].innerCleanliness, "REGULAR")
        XCTAssertEqual(result[1].carImageUrl, "https://de.drive-now.com/static/drivenow/img/cars/mini.png")
    }
    // swiftlint:enable function_body_length

}
