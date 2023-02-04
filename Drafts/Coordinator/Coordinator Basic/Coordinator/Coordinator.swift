//
//  Coordinator.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
	var childCoordinators: [CoordinatorProtocol] { get set }
	var navigationController: UINavigationController { get set }
	func start()
	func showGreenVC()
	func showBlueVC() 
}

final class MainCoordinator: CoordinatorProtocol {
	var childCoordinators: [CoordinatorProtocol] = []

	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}

	func showGreenVC() {
		let vc = GreenViewController(coordinator: self)
		navigationController.pushViewController(vc, animated: true)
	}

	func showBlueVC() {
		let vc = BlueViewController(coordinator: self)
		navigationController.pushViewController(vc, animated: true)
	}
}
