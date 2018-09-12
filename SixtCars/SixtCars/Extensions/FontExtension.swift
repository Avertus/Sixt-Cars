//
//  FontExtension.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    private enum Constants {
        static let RegularFont = "HelveticaNeue"
        static let BoldFont = "HelveticaNeue-Bold"

        // Font Sizes
        static let SmallFontSize: CGFloat = 12
        static let DefaultFontSize: CGFloat = 14
        static let BigFontSize: CGFloat = 20
    }

    static var defaultFont: UIFont {
        return UIFont(name: Constants.RegularFont, size: Constants.DefaultFontSize) ?? UIFont.systemFont(ofSize: Constants.DefaultFontSize)
    }

    static var smallFont: UIFont {
        return UIFont(name: Constants.RegularFont, size: Constants.SmallFontSize) ?? UIFont.systemFont(ofSize: Constants.SmallFontSize)
    }

    static var bigFont: UIFont {
        return UIFont(name: Constants.BoldFont, size: Constants.BigFontSize) ?? UIFont.systemFont(ofSize: Constants.BigFontSize)
    }

    static func regularFont(size fontSize: CGFloat = 14) -> UIFont {
        return UIFont(name: Constants.RegularFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

    static func boldFont(size fontSize: CGFloat = 20) -> UIFont {
        return UIFont(name: Constants.BoldFont, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }

    static var italicDefaultFont: UIFont {
        return UIFont.italicSystemFont(ofSize: Constants.DefaultFontSize)
    }

}
