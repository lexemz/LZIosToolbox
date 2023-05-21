//
//  ViewController.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var pinPadView: PinPadView = {
		let pinPad = PinPadView()
		pinPad.translatesAutoresizingMaskIntoConstraints = false
		return pinPad
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		setupUI()
		setupConstraints()
	}

}

// MARK: - Private extension

private extension ViewController {
	func setupUI() {
		view.addSubview(pinPadView)
	}

	func setupConstraints() {
		let insets: CGFloat = 65

		let constraints = [
			pinPadView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			pinPadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
			pinPadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
			pinPadView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),
		]

		NSLayoutConstraint.activate(constraints)
	}
}
