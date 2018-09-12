//
//  UIViewExtension.swift
//  SixtCars
//
//  Created by Deniz Gultek on 12.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit

extension UIView {

    func addAndAdaptSubViewToSuperView(subView: UIView, leading: Int = 0, trailing: Int = 0, top: Int = 0, bottom: Int = 0) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(subView)
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(leading)-[subView]-\(trailing)-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subView": subView]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(top)-[subView]-\(bottom)-|",
            options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["subView": subView]))
    }

}
