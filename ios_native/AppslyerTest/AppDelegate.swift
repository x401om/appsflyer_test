//
//  AppDelegate.swift
//  AppslyerTest
//
//  Created by Aleksey Goncharov on 26/09/2019.
//  Copyright © 2019 Easy Fasting. All rights reserved.
//

import UIKit
import AppsFlyerLib

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, AppsFlyerTrackerDelegate {


    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppsFlyerTracker.shared().appsFlyerDevKey = "insert_dev_key"
        AppsFlyerTracker.shared().appleAppID = "insert_app_id"

        AppsFlyerTracker.shared().delegate = self

        /* Set isDebug to true to see AppsFlyer debug logs */
        AppsFlyerTracker.shared().isDebug = true

        
        AppsFlyerTracker.shared()?.trackAppLaunch(completionHandler: { (result, error) in
            print("APP: trackAppLaunch")
        })
        return true
    }

    // rest of your code, methods such as applicationWillResignActive, applicationDidEnterBackground etc.

    //get conversion data and deep linking

    func onConversionDataReceived(_ installData: [AnyHashable: Any]) {
        print("APP: onConversionDataReceived")
    }

    func onConversionDataRequestFailure(_ error: Error?) {
        print("APP: onConversionDataRequestFailure")
    }

    func onAppOpenAttribution(_ attributionData: [AnyHashable: Any]) {
        print("APP: onAppOpenAttribution")
    }

    func onAppOpenAttributionFailure(_ error: Error?) {
        print("APP: onAppOpenAttributionFailure")
    }
    // Reports app open from a Universal Link for iOS 9 or later
    private func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([Any]?) -> Void) -> Bool {
        AppsFlyerTracker.shared().continue(userActivity, restorationHandler: restorationHandler)
        return true
    }

    // Reports app open from deep link from apps which do not support Universal Links (Twitter) and for iOS8 and below
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        AppsFlyerTracker.shared().handleOpen(url, sourceApplication: sourceApplication, withAnnotation: annotation)
        return true
    }

    // Reports app open from deep link for iOS 10 or later
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        AppsFlyerTracker.shared().handleOpen(url, options: options)
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppsFlyerTracker.shared()?.trackAppLaunch(completionHandler: { (result, error) in
            print("APP: trackAppLaunch")
        })
    }


}

