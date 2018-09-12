//
//  UIImageViewExtension.swift
//  SixtCars
//
//  Created by Deniz Gultek on 11.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit
import SixtNetwork

extension UIImageView {

    func loadCarImage(_ carData: CarData, imageSetHandler: (() -> Void)?) {
        image = #imageLiteral(resourceName: "carPlaceholder")

        DriveNowService.instance.getCarImage(carData: carData,
            successHandler: { [weak self] carImage in
                guard let strongSelf = self else { return }
                DispatchQueue.main.async {
                    strongSelf.image = carImage
                    guard let imageSetHandler = imageSetHandler else {
                        sixtLogger.error("## ImageSetHandler found nil.##")
                        return
                    }
                    imageSetHandler()
                }
            }, errorHandler: { error in
                sixtLogger.error(error.description)
            })
    }

}
