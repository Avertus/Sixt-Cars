//
//  DataParsersTests.swift
//  SixtNetworkTests
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
import UIKit
@testable import SixtNetwork

class DataParsersTests: XCTestCase {

    func test_ParseJson_Error() {
        var errorDescription: String?

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: (([CarData]) -> Void)? = { carList in
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            errorDescription = error.description
            parsedExpectation.fulfill()
        }
        DataParsers.parseJSON(data: Data(), successHandler: successHandler, errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(errorDescription!, "Internal Error")
    }

    // swiftlint:disable function_body_length
    func test_ParseJson_Success() {
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
        var result: [CarData] = []

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: (([CarData]) -> Void)? = { carList in
            result = carList
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            parsedExpectation.fulfill()
        }
        DataParsers.parseJSON(data: jsonData, successHandler: successHandler, errorHandler: errorHandler)

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

    func test_ParseImage_Error() {
        var errorDescription: String?

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: ((UIImage) -> Void)? = { carList in
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            errorDescription = error.description
            parsedExpectation.fulfill()
        }
        DataParsers.parseImage(data: Data(), successHandler: successHandler, errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(errorDescription!, "Internal Error")
    }

    func test_ParseImage_Success() {
        let bundle = Bundle(for: DataParsersTests.self)
        let image = UIImage(named: "testImage", in: bundle, compatibleWith: nil)

        let imageData = UIImagePNGRepresentation(image!)
        var result: UIImage?

        let parsedExpectation = expectation(description: "Parsing finished.")
        let successHandler: ((UIImage) -> Void)? = { image in
            result = image
            parsedExpectation.fulfill()
        }
        let errorHandler: ((ConnectionError) -> Void)? = { error in
            parsedExpectation.fulfill()
        }
        DataParsers.parseImage(data: imageData!, successHandler: successHandler, errorHandler: errorHandler)

        wait(for: [parsedExpectation], timeout: 5)
        XCTAssertEqual(result!.size, image!.size)
    }

}
