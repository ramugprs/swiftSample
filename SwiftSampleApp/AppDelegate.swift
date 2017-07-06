//
//  AppDelegate.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 4/29/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mNav:UINavigationController?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //sleep(2)
        
//        self.window = UIWindow(frame:UIScreen.main.bounds)
//        
//        let mLocationVC:DeliveryLocationVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "DeliveryLocationVC") as! DeliveryLocationVC
//        
//        mNav = UINavigationController(rootViewController:mLocationVC)
//        
//        mNav?.navigationBar.isHidden = true
//        
//        self.window?.rootViewController = mNav
//        
//        
//        self.window?.makeKeyAndVisible()
        
        
        // this is for keyboard
        
        IQKeyboardManager.sharedManager().enable = true

        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let months = DateFormatter().monthSymbols
        let days = DateFormatter().weekdaySymbols
        
        let sideVC_L:SideMenuController = (storyBoard.instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController)!
        
        sideVC_L.menuItems = days as NSArray!
        
        let sideVC_R : SideMenuController = (storyBoard.instantiateViewController(withIdentifier: "SideMenuController") as? SideMenuController)!
        sideVC_R.menuItems = days as NSArray!
        
        let rootVC:DeliveryLocationVC = storyBoard.instantiateViewController(withIdentifier: "DeliveryLocationVC") as! DeliveryLocationVC
        
        
        
        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC, leftMenuController: sideVC_L, rightMenuController: sideVC_R, leftMenuType: .SlideView, rightMenuType: .SlideView)
        
        SJSwiftSideMenuController.setUpLeftMenuWidth(width: 300)
        
        SJSwiftSideMenuController.enableSwipeGestureWithMenuSide(menuSide: .LEFT)
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

