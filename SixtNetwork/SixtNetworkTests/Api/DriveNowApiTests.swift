//
//  DriveNowApiTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
@testable import SixtNetwork

class DriveNowApiTests: XCTestCase {

    var driveNowApi: DriveNowApi!
    var mockBaseConnection: MockBaseConnection!

    override func setUp() {
        mockBaseConnection = MockBaseConnection()
        driveNowApi = DriveNowApi(connection: mockBaseConnection)
    }

    func test_GetCarImage_ConnectionError() {
        mockBaseConnection.errorValue = ConnectionError.httpError(statusCode: HttpStatusCode.imATeapot)
        mockBaseConnection.isSuccess = false

        var errorDescription: String?
        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: ((UIImage) -> Void)? = { carList in
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            errorDescription = error.description
            parsedExpectation.fulfill()
        }

        driveNowApi.getCarImage(modelIdentifier: "mini",
                                color: "midnight_black",
                                fallBackImageURL: "https://de.drive-now.com/static/drivenow/img/cars/mini.png",
                                successHandler: successHandler,
                                errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(errorDescription!, "HTTP Error with status Code: imATeapot")
    }

    func test_GetCarImage_Success() {
        let bundle = Bundle(for: DriveNowApiTests.self)
        let image = UIImage(named: "testImage", in: bundle, compatibleWith: nil)
        let imageData = UIImagePNGRepresentation(image!)
        mockBaseConnection.successValue = imageData
        mockBaseConnection.isSuccess = true
        var result: UIImage?

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: ((UIImage) -> Void)? = { image in
            result = image
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            parsedExpectation.fulfill()
        }

        driveNowApi.getCarImage(modelIdentifier: "mini",
                                color: "midnight_black",
                                fallBackImageURL: "https://de.drive-now.com/static/drivenow/img/cars/mini.png",
                                successHandler: successHandler,
                                errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(result!.size, image!.size)
    }

}
