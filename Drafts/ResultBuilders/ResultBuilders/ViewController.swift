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
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .red
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(redView)
		createConstraints()
	}


	enum ConstraintType {
		case first
		case second
		case third
	}

	var bottomConstraint: NSLayoutConstraint?
	private func createConstraints() {
		let safeArea = view.safeAreaLayoutGuide
		let constraintType = ConstraintType.third

		let arrayOfConstraints = NSLayoutConstraint.arrayOf {
			redView.topAnchor.constraint(equalTo: safeArea.topAnchor)
			redView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor)
		}

		bottomConstraint = redView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
		NSLayoutConstraint.activate {
			arrayOfConstraints

			switch constraintType {
			case .first:
				redView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			case .second:
				redView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			default:
				redView.heightAnchor.constraint(equalToConstant: 100)
			}

			if let bottomConstraint {
				bottomConstraint
			}
		}
	}
}
