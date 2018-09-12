//
//  CarListViewModel.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation

protocol CarListViewModelProtocol {

    /// Total number of cars.
    ///
    /// - Returns: Car list count.
    func getRowCount() -> Int

    /// Returns car model which is selected at index.
    ///
    /// - Parameters:
    ///   - row: Index of the selected car.
    /// - Returns: Car model.
    func getCarForRow(_ row: Int) -> CarModel?

}

class CarListViewModel: CarListViewModelProtocol {

    private let carModels: [CarModel]!

    init(_ carModels: [CarModel]) {
        self.carModels = carModels
    }

    func getRowCount() -> Int {
        return carModels.count
    }

    func getCarForRow(_ row: Int) -> CarModel? {
        return carModels[row]
    }

}
