//
//  Label.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit

@IBDesignable
class Label: UILabel {

    @IBInspectable var localizationKey: String?
    @IBInspectable var isBold: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        text = localizationKey?.localized
        applyDesign()
    }

    func applyDesign() {
        if isBold {
            font = UIFont.boldFont()
        } else {
            font = UIFont.regularFont()
        }
    }

}
