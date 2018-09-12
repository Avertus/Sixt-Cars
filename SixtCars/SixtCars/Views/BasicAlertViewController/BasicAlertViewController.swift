//
//  BasicAlertViewController.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit

class BasicAlertViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var descriptionLabel: Label!
    @IBOutlet weak var okButton: Button!

    // MARK: - Dependencies

    var titleText: String?
    var descriptionText: String?
    var buttonTitleText: String?
    var completionHandler: (() -> Void)?

    // MARK: - Lifecycle

    required public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .overCurrentContext
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        okButton.titleLabel?.text = buttonTitleText
    }

    @IBAction func okButtonClicked(_ sender: Button) {
        dismiss(animated: false, completion: { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.completionHandler?()
        })
    }

}

extension BasicAlertViewController {

    func configureViews() {
        let shadowPath = UIBezierPath(rect: containerView.bounds)
        containerView.layer.cornerRadius = 3.0
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowPath = shadowPath.cgPath
    }

}
