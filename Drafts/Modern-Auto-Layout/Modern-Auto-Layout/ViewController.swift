//
//  ViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 28.05.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
//		makeView()
	}

	func makeView() {
		// Use frame to set initial size and position of view
		let view = UIView(frame: CGRect(x: 59, y: 220, width: 275, height: 150))
		view.backgroundColor = .cyan

		print(view.frame.size)

//		view.autoresizingMask = [.flexibleWidth,
//								 .flexibleBottomMargin]

		self.view.addSubview(view)
	}

}

