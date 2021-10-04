//
//  SceneDelegate.swift
//  be-you
//
//  Created by wonhee on 2021/09/14.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    enum Design {
        static let navigationShadowColor = UIColor(rgb: 0x9B9B9B)
        static let navigationShadowOpacity: Float = 0.7
        static let navigationShadowOffset = CGSize.zero
        static let navigationShadowRadius: CGFloat = 5

        static let navigationTitleColor = UIColor(rgb: 0x7B7B7B)
        static let navigationTitleFont = UIFont(type: .bold, size: 17)
    }

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let mainViewController = MainViewController()
        let navigationViewController = UINavigationController(rootViewController: mainViewController)
        settingNavigation(navigationViewController)
        window?.rootViewController = navigationViewController
        window?.makeKeyAndVisible()
    }

    private func settingNavigation(_ navigationViewController: UINavigationController) {
        navigationViewController.navigationBar.shadowImage = UIImage()
        navigationViewController.navigationBar.layer.shadowColor = Design.navigationShadowColor.cgColor
        navigationViewController.navigationBar.layer.shadowOpacity = Design.navigationShadowOpacity
        navigationViewController.navigationBar.layer.shadowOffset = Design.navigationShadowOffset
        navigationViewController.navigationBar.layer.shadowRadius = Design.navigationShadowRadius
        navigationViewController.navigationBar.layer.shadowPath = UIBezierPath(roundedRect: navigationViewController.navigationBar.bounds, cornerRadius: Design.navigationShadowRadius).cgPath

        if let navigationTitleFont = Design.navigationTitleFont {
            let attributes: [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: navigationTitleFont, NSAttributedString.Key.foregroundColor: Design.navigationTitleColor]
            UINavigationBar.appearance().titleTextAttributes = attributes
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

