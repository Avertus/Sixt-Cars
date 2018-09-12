//
//  CarListTableViewCell.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit

class CarListTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var carImageContainerView: UIView!
    @IBOutlet weak var groupLabel: Label!
    @IBOutlet weak var modelNameLabel: Label!
    @IBOutlet weak var seriesLabel: Label!
    @IBOutlet weak var nameLabel: Label!

    // MARK: - Dependencies
    var addedImageView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "carPlaceholder"))

    // MARK: - Lifecycle

    override func draw(_ rect: CGRect) {
        configureViews()
    }

}

extension CarListTableViewCell {

    func configure(_ carModel: CarModel) {
        addedImageView.removeFromSuperview()
        if let imageView = carModel.carImage {
            addedImageView = imageView
        } else {
            addedImageView = UIImageView(image: #imageLiteral(resourceName: "carPlaceholder"))
        }
        carImageContainerView.addAndAdaptSubViewToSuperView(subView: addedImageView)
        groupLabel.text = carModel.group
        modelNameLabel.text = carModel.modelName
        seriesLabel.text = carModel.series
        nameLabel.text = carModel.name
    }

    private func configureViews() {
        let shadowPath = UIBezierPath(rect: containerView.bounds)
        containerView.layer.cornerRadius = 3.0
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowOpacity = 0.4
        containerView.layer.shadowPath = shadowPath.cgPath
    }

}
