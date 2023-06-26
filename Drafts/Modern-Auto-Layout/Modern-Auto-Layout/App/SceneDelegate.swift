//
//  SceneDelegate.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 28.05.2023.
//

import UIKit

class SceneDelegate: UIResponder {
	var window: UIWindow?
}

extension SceneDelegate: UIWindowSceneDelegate {
	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		guard let scene = (scene as? UIWindowScene) else { return }

		let selectionVC = SelectionViewController(items: itemsManifest)
		selectionVC.title = "Modern Auto Layout"

		window = UIWindow(windowScene: scene)
		window?.rootViewController = UINavigationController(rootViewController: selectionVC)
		window?.makeKeyAndVisible()
	}
}

