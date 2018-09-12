//
//  ViewController.swift
//  SixtCars
//
//  Created by Deniz Gultek on 8.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    private var isNavigationBarHidden: Bool = false

    required override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationController()
    }

    func setupNavigationBar(isHidden: Bool, title: String? = nil) {
        isNavigationBarHidden = isHidden
        self.title = title
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    func initializeNavigationController(withShadow: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        if withShadow {
            self.navigationController?.navigationBar.layer.shadowColor = UIColor.sixtGray?.cgColor
            self.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            self.navigationController?.navigationBar.layer.shadowRadius = 4.0
            self.navigationController?.navigationBar.layer.shadowOpacity = 0.4
            self.navigationController?.navigationBar.layer.masksToBounds = false
        }
    }

    private func configureNavigationController() {
        self.navigationController?.setNavigationBarHidden(isNavigationBarHidden, animated: true)
    }

}
