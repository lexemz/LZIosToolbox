//
//  ViewController.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

	var coordinator: CoordinatorProtocol?

	override func viewDidLoad() {
		super.viewDidLoad()
		setupTestButtons()
	}

	override func testButtonsPressed(_ sender: UIButton) {
		switch sender.tag {
		case 0: coordinator?.showBlueVC()
		case 1: coordinator?.showGreenVC()
		case 2: coordinator?.showBlueVCAfterGreenVC()
		default: break
		}
	}

}

