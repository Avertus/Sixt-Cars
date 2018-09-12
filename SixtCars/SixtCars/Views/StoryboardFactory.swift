//
//  StoryboardFactory.swift
//  SixtCars
//
//  Created by Deniz Gultek on 10.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import Foundation
import UIKit

enum StoryboardIds {
    case carMap
    case carList
    case basicAlert
    case basicActivityIndicator

    var id: String {
        switch self {
        case .carMap:
            return "CarMap"
        case .carList:
            return "CarList"
        case .basicAlert:
            return "BasicAlert"
        case .basicActivityIndicator:
            return "BasicActivityIndicator"
        }
    }
}

class StoryboardFactory {

    static func initialViewController(for storyBoardId: StoryboardIds) -> UIViewController {
        guard let viewController = UIStoryboard(name: storyBoardId.id, bundle: nil).instantiateInitialViewController() else {
            return UIViewController()
        }
        return viewController
    }

    static func viewController(for storyBoardId: StoryboardIds) -> UIViewController {
        return UIStoryboard(name: storyBoardId.id, bundle: nil).instantiateViewController(withIdentifier: storyBoardId.id)
    }
}
