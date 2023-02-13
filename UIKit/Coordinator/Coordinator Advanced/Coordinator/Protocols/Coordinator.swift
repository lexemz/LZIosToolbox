//
//  Coordinator.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

protocol Coordinator: AnyObject {
	var childCoordinators: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	func start()
}
