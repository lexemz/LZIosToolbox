//
//  ViewController.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var numericPadView: NumericPadView = {
		let numericPad = NumericPadView()
		numericPad.translatesAutoresizingMaskIntoConstraints = false
		return numericPad
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
		view.addSubview(numericPadView)

		numericPadView.backgroundColor = .red
	}

	func setupConstraints() {
		let insets: CGFloat = 40

		let constraints = [
			numericPadView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			numericPadView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			numericPadView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets),
			numericPadView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets),
		]

		NSLayoutConstraint.activate(constraints)
	}
}
