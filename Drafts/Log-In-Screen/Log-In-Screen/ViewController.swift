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
		let insets: CGFloat = 20

		let constraints = [
			numericPadView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height / 2),
			numericPadView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets),
			numericPadView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets),
			numericPadView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		]

		NSLayoutConstraint.activate(constraints)
	}
}
