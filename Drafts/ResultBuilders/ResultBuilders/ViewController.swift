//
//  ViewController.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var greenView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemGreen
		return view
	}()

	private lazy var yellowView: UIView = {
		let view = UIView()
		view.backgroundColor = .systemYellow
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubviews {
			greenView
			yellowView
		}
		createConstraints()
	}

	var constraint: NSLayoutConstraint?


	private func createConstraints() {
		let safeArea = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate {
			greenView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor)

			greenView.heightAnchor.constraint(equalToConstant: 100)
			greenView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
			greenView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)

			yellowView.heightAnchor.constraint(equalToConstant: 100)
			yellowView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20)
			yellowView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)

//			yellowView.bottomAnchor.constraint(equalTo: greenView.topAnchor, constant: -8)

			greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8)
		}
	}
}
