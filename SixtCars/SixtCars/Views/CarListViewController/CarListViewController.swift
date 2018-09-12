//
//  CarListViewController.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit

class CarListViewController: ViewController {

    struct NibIdentifiers {
        static let carListTableViewCell = "CarListTableViewCell"
    }

    struct CellIdentifiers {
        static let carListTableViewCell = "CarListTableViewCell"
    }

    // MARK: - Outlets

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Dependencies

    private var carListViewModel: CarListViewModelProtocol?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(isHidden: false, title: "CarList".localized)
        setupTableView()
    }

}

extension CarListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = carListViewModel else { return 0 }
        return viewModel.getRowCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = carListViewModel else { return UITableViewCell() }

        if let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.carListTableViewCell, for: indexPath) as? CarListTableViewCell {
            guard let carModel = viewModel.getCarForRow(indexPath.row) else {
                return UITableViewCell()
            }
            cell.configure(carModel)
            return cell
        }
        return UITableViewCell()
    }

}

extension CarListViewController: UITableViewDelegate {

}

extension CarListViewController {

    func setupViewModel(_ viewModel: CarListViewModelProtocol) {
        self.carListViewModel = viewModel
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: NibIdentifiers.carListTableViewCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.carListTableViewCell)
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }

}
