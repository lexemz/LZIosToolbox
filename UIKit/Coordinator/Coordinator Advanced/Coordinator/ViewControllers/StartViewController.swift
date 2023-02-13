//
//  StartViewController.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

class StartViewController: UIViewController, Storyboarded {

	weak var coordinator: MainCoordinatorProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func showRegistration(_ sender: Any) {
		coordinator?.showRegistrationVC()
	}

	@IBAction func showBuy(_ sender: Any) {
		coordinator?.showBuyVC()
	}

	@IBAction func showChatModally(_ sender: Any) {
		coordinator?.showChatVCModally()
	}
}

