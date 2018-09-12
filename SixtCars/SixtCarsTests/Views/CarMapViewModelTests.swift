//
//  CarMapViewModelTests.swift
//  SixtCarsTests
//
//  Created by Deniz Gultek on 12.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import XCTest
import SixtNetwork

@testable import SixtCars

class CarMapViewModelTests: XCTestCase {

    func testViewModel_Methods() {
        let viewModel = CarMapViewModel()
        XCTAssertNotNil(viewModel)
    }

}
