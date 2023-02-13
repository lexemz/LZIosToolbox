//
//  ChatCoordinator.swift
//  Coordinator
//
//  Created by Igor Buzykin on 12.02.2023.
//

import UIKit

protocol ChatCoordinatorProtocol {
	func endChat()
}

final class ChatCoordinator: Coordinator {
	var childCoordinators: [Coordinator] = []

	var navigationController: UINavigationController
	var parentCoordinator: MainCoordinatorProtocol?

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func start() {
		let vc = ChatViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
}

extension ChatCoordinator: ChatCoordinatorProtocol {
	func endChat() {
		navigationController.dismiss(animated: true)
		parentCoordinator?.childDidFinish(self)
	}
}
