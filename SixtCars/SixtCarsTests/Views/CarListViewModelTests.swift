//
//  CarListViewModelTests.swift
//  SixtCarsTests
//
//  Created by Deniz Gultek on 12.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
import SixtNetwork

@testable import SixtCars

class CarListViewModelTests: XCTestCase {

    func testViewModel_Methods() {
        let carData1 = CarData(id: "WMWSW31030T222518",
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
        let carData2 = CarData(id: "WMWSW31030T222518",
                              modelIdentifier: "opel",
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
        let viewModel = CarListViewModel([CarModel(carData1), CarModel(carData2)])

        XCTAssertNotNil(viewModel)
        XCTAssertEqual(viewModel.getRowCount(), 2)
        XCTAssertEqual(viewModel.getCarForRow(0)?.modelIdentifier, "mini")
        XCTAssertEqual(viewModel.getCarForRow(1)?.modelIdentifier, "opel")
    }

}
