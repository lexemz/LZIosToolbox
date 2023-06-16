//
//  MyViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 31.05.2023.
//

import UIKit

class MyViewController: UIViewController {

	let button = UIButton(configuration: .tinted())


	override func loadView() {
		let view = UIView()
		view.backgroundColor = .red
		self.view = view
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		print(#function, view.frame, view.safeAreaInsets)
	}

//	override func viewIsAppearing(_ animated: Bool) {
//		super.viewIsAppearing(animated)
//		print(#function, view.frame, view.safeAreaInsets)
//	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		print(#function, view.frame, view.safeAreaInsets)
		configureButton()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		print(#function, view.frame, view.safeAreaInsets)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		print(#function, view.frame, view.safeAreaInsets)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		print(#function, view.frame, view.safeAreaInsets)
	}

	func configureButton() {
		view.addSubview(button)
		button.frame.size = CGSize(width: 100, height: 100)
		button.center = view.center
		button.setTitle("GO", for: .normal)


		let action = UIAction { _ in
			self.dismiss(animated: true)
		}
		button.addAction(action, for: .touchUpInside)
	}
}
