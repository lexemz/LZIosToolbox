//
//  SceneDelegate.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	var coordinator: MainCoordinator?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }

		let navigationController = UINavigationController()

		coordinator = MainCoordinator(navigationController: navigationController)
		coordinator?.start()

		window = UIWindow(windowScene: windowScene)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}

