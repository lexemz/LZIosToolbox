//
//  ViewController.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 22.06.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var redView: UIView = {
		let view = UIView()
		view.backgroundColor = .red
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubviews {
			redView
		}
		createConstraints()
	}

	var constraint: NSLayoutConstraint?


	private func createConstraints() {
		let safeArea = view.safeAreaLayoutGuide

		NSLayoutConstraint.activate {
			redView.topAnchor.constraint(equalTo: safeArea.topAnchor)
			redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
			redView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			redView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
		}
	}
}
