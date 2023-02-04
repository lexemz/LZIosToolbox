//
//  BuyCoordinator.swift
//  Coordinator
//
//  Created by Igor Buzykin on 12.02.2023.
//

import UIKit

protocol BuyCoordinatorProtocol: AnyObject {
	func openBuy2()
}

final class BuyCoordinator: Coordinator {
	var navigationController: UINavigationController
	var childCoordinators: [Coordinator] = []

	init(navigationController: UINavigationController) {
		 self.navigationController = navigationController
	 }

	func start() {
		let vc = BuyViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}

}

extension BuyCoordinator: BuyCoordinatorProtocol {

	func openBuy2() {
		let vc = BuyViewController2.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: true)
	}
}
