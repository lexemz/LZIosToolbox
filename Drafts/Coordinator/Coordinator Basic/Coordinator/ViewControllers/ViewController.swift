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
		if sender.tag == 0 {
			coordinator?.showBlueVC()
		} else if sender.tag == 1 {
			coordinator?.showGreenVC()
		}
	}

}

