//
//  AppDelegate.swift
//  SixtCars
//
//  Created by Deniz Gultek on 8.09.2018.
//  Copyright © 2018 Sixt. All rights reserved.
//

import UIKit
import SixtCommon
import SixtNetwork

/// Global logger manager instance.
let sixtLogger = LoggerManager.instance

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    override init() {
        SixtNetwork.configure(SixtNetworkConfiguration())
        super.init()
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        #if DEVELOPMENT
            sixtLogger.setLogLevel(.debug)
        #elseif RELEASE
            sixtLogger.setLogLevel(.error)
        #endif

        sixtLogger.info("=== Application did finish launching ===")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        sixtLogger.info("=== Application will resign active ===")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        sixtLogger.info("=== Application did enter background ===")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        sixtLogger.info("=== Application did enter foreground ===")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        sixtLogger.info("=== Application did become active ===")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        sixtLogger.info("=== Application will terminate ===")
    }

}
