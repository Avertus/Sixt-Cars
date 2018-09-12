//
//  AlertManager.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

class AlertManager {

    static let instance = AlertManager()
    private var activityIndicatorViewController: BasicActivityIndicatorViewController?

    private init() { }

    func showAlert(titleText: String?, descriptionText: String?, buttonTitleText: String?, completionHandler: (() -> Void)?) {
        if let topController = UIApplication.topViewController(),
            !topController.isKind(of: BasicActivityIndicatorViewController.self) {
            guard let alertViewController = StoryboardFactory.initialViewController(for: .basicAlert) as? BasicAlertViewController else { return }

            alertViewController.completionHandler = completionHandler

            alertViewController.titleText = titleText
            alertViewController.descriptionText = descriptionText
            alertViewController.buttonTitleText = buttonTitleText

            topController.present(alertViewController, animated: false)
        }

    }

    func showActivityIndicator() {
        if let topController = UIApplication.topViewController(),
            !topController.isKind(of: BasicAlertViewController.self) {
            guard let indicatorViewController = StoryboardFactory.initialViewController(for: .basicActivityIndicator) as? BasicActivityIndicatorViewController else { return }
            topController.present(indicatorViewController, animated: false)
            activityIndicatorViewController = indicatorViewController
        }
    }

    func hideActivityIndicator() {
        if let activityIndicatorViewController = activityIndicatorViewController {
            activityIndicatorViewController.dismiss(animated: false, completion: { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.activityIndicatorViewController = nil
            })
        }
    }

}
