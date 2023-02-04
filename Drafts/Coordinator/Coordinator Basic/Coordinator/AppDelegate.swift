//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}



extension UIViewController {

	func setupTestButtons() {
		var buttons: [UIButton] = []

		for i in 0..<3 {
			let button = UIButton()
			button.backgroundColor = .systemGray
			button.setTitle("tag: \(i)", for: .normal)
			button.addTarget(self, action: #selector(testButtonsPressed(_:)), for: .touchUpInside)
			button.tag = i
			button.translatesAutoresizingMaskIntoConstraints = false
			buttons.append(button)
		}

		buttons.forEach { view.addSubview($0) }

		let stackview = UIStackView(arrangedSubviews: buttons)
		stackview.translatesAutoresizingMaskIntoConstraints = false
		stackview.axis = .vertical
		stackview.distribution = .fillEqually
		stackview.spacing = 10
		view.addSubview(stackview)
		NSLayoutConstraint.activate([
			stackview.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			stackview.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			stackview.heightAnchor.constraint(equalToConstant: 200),
			stackview.widthAnchor.constraint(equalToConstant: 250)
		])
	}

	@objc
	func testButtonsPressed(_ sender: UIButton) {
		print("Please override method `testButtonPressed`")
	}
}

