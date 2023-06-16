//
//  ViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 28.05.2023.
//

import UIKit

class ViewController: UIViewController {

	let button = UIButton(configuration: .tinted())

	let padding: CGFloat = 50.0

	private let manualCustomView: UIView = {
		let view = CustomView()
		view.backgroundColor = .green
		return view
	}()

	override func loadView() {
		let view = UIView()
		view.backgroundColor = .systemBackground
		self.view = view
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		print(#function, view.frame, view.safeAreaInsets)
		view.addSubview(manualCustomView)
	}

//	override func viewIsAppearing(_ animated: Bool) {
//		super.viewIsAppearing(animated)
//		print(#function, view.frame, view.safeAreaInsets)
//	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		print(#function, view.frame, view.safeAreaInsets)
		let width = view.bounds.width - 2 * padding
		manualCustomView.frame = CGRect(x: padding,
								 y: padding,
								 width: width,
								 height: 3 * padding)
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
			let vc = MyViewController()
			vc.modalPresentationStyle = .fullScreen
			self.present(vc, animated: true)
		}
		button.addAction(action, for: .touchUpInside)
	}
}
