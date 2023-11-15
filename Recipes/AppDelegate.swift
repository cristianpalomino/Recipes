//
//  AppDelegate.swift
//  Recipes
//
//  Created by Cristian on 10/11/23.
//

import UIKit
import RecipesUI
import RecipesCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        var viewModel = DashboardViewModel(service: Services.live)
        let rootViewController = DashboardViewController(viewModel: viewModel)
        let navigationController = NavigationController(rootViewController: rootViewController)
        navigationController.setup()

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

