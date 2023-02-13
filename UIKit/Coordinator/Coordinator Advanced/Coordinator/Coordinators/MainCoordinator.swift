//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Igor Buzykin on 11.02.2023.
//

import UIKit

protocol MainCoordinatorProtocol: AnyObject {
	func showRegistrationVC()
	func showBuyVC()
	func showChatVCModally()
	func childDidFinish(_ child: Coordinator?)
}

final class MainCoordinator: NSObject, Coordinator {
	var childCoordinators: [Coordinator] = [] {
		didSet { print(childCoordinators) }
	}

	var navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = StartViewController.instantiate()
		vc.coordinator = self
		navigationController.delegate = self
		navigationController.pushViewController(vc, animated: false)
	}

	func childDidFinish(_ child: Coordinator?) {
		for (index, childCoordinator) in childCoordinators.enumerated() {
			if childCoordinator === child {
				childCoordinators.remove(at: index)
				break
			}
		}
	}
}

extension MainCoordinator: MainCoordinatorProtocol {

	func showRegistrationVC() {
		let vc = RegistrationViewController.instantiate()
		navigationController.pushViewController(vc, animated: true)
	}

	func showBuyVC() {
		let childCoordinator = BuyCoordinator(navigationController: navigationController)
		childCoordinators.append(childCoordinator)
		childCoordinator.start()
	}

	func showChatVCModally() {
		let navigationController = UINavigationController()
		navigationController.modalPresentationStyle = .fullScreen

		let childCoordinator = ChatCoordinator(navigationController: navigationController)
		childCoordinator.parentCoordinator = self
		childCoordinators.append(childCoordinator)
		childCoordinator.start()

		self.navigationController.present(navigationController, animated: true)
	}
}

extension MainCoordinator: UINavigationControllerDelegate {
	func navigationController(
		_ navigationController: UINavigationController,
		didShow viewController: UIViewController,
		animated: Bool
	) {
		guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
			return
		}
		if navigationController.viewControllers.contains(fromViewController) { return }

		if let buyViewController = fromViewController as? BuyViewController {
			childDidFinish(buyViewController.coordinator as? Coordinator)
		}
	}
}
