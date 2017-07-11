//
//  AppDelegate.swift
//  Westeros
//
//  Created by Carlos on 5/7/17.
//  Copyright © 2017 THO. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Esto tan sólo pinta un rectángulo
        //window = UIWindow(frame: <#T##CGRect#>)
        
        // Crear Window
        // Para ocupar toda la pantalla - Todavía fallaría
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.cyan
        
        // Creamos uno modelos
        let houses = Repository.local.houses
        
        // Creamos los controladores
        var controllers = [HouseViewController]()
        for house in houses{
            controllers.append(HouseViewController(model: house))
        }
        
        //Creamos los Navigations
        var navs = [UINavigationController]()
        for controller in controllers{
            navs.append(UINavigationController(rootViewController: controller))
        }
        
        // Creamos el TabBar
        let tabVC = UITabBarController()
        tabVC.viewControllers = navs
        
        // Asignamos el RootVC
        //window?.rootViewController = starkNav
        window?.rootViewController = tabVC
        
        // Crear RootVC
        // Tiene que haber un rootController o no arrranca
        // Tras asignarlo ya se puede arrancar
        // let rootVC = UIViewController()
        // Asignar el RootVC
        // window?.rootViewController = rootVC
        
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

