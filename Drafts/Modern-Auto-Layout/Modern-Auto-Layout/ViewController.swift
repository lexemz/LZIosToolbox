//
//  ViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 28.05.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var customView: CustomView!

	let padding: CGFloat = 50.0

	private let manualCustomView: UIView = {
		let view = CustomView()
		view.backgroundColor = .green
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubview(manualCustomView)
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		let width = view.bounds.width - 2 * padding
		manualCustomView.frame = CGRect(x: padding,
								 y: padding,
								 width: width,
								 height: 3 * padding)
	}
}

