//
//  Button.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Button: UIButton {

    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var localizationKey: String?
    @IBInspectable var isBold: Bool = false

    override func awakeFromNib() {
        setTitle(localizationKey?.localized, for: UIControlState.normal)
        super.awakeFromNib()
    }

    func applyDesign() {
        if isBold {
            titleLabel?.font = UIFont.boldFont()
        } else {
            titleLabel?.font = UIFont.regularFont()
        }
    }

}
