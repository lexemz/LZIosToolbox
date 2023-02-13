//
//  GreenViewController.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

final class GreenViewController: UIViewController {

	private weak var coordinator: CoordinatorProtocol?

	init(coordinator: CoordinatorProtocol) {
		self.coordinator = coordinator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	deinit {
		print("deinit \(self)")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .green
		setupTestButtons()
	}

	override func testButtonsPressed(_ sender: UIButton) {
		coordinator?.showBlueVC()
	}
}
