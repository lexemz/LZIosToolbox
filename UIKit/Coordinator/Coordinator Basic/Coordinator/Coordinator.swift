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
	func showBlueVCAfterGreenVC()
}

final class MainCoordinator: NSObject, CoordinatorProtocol {
	var childCoordinators: [CoordinatorProtocol] = []

	var navigationController: UINavigationController

	private var viewControllersPath: [UIViewController] = []

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.delegate = self
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

	func showBlueVCAfterGreenVC() {
		pushViewControllersByPath(
			viewControllers: [
				GreenViewController(coordinator: self),
				BlueViewController(coordinator: self),
				GreenViewController(coordinator: self)
			]
		)
	}
}

extension MainCoordinator: UINavigationControllerDelegate {

	func navigationController(
		_ navigationController: UINavigationController,
		didShow viewController: UIViewController,
		animated: Bool
	) {
		pathPush()
	}

	private func pushViewControllersByPath(
		viewControllers: [UIViewController]
	) {
		viewControllersPath = viewControllers
		pathPush()
	}

	private func pathPush() {
		guard let vc = viewControllersPath[safe: 0] else { return }
		navigationController.pushViewController(vc, animated: true)
		viewControllersPath.removeFirst()
	}
}
