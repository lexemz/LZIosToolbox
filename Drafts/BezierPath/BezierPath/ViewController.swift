//
//  ViewController.swift
//  BezierPath
//
//  Created by Igor Buzykin on 12.03.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var popUpButton: UIButton!

	var bezierView: UIView!

	override func viewDidLoad() {
		super.viewDidLoad()
		setupPopUpButton()
	}

	private func setupPopUpButton() {
		popUpButton.menu = UIMenu(children: [
			UIAction(title: "Nothing") { _ in
				self.removeView()
			},
			UIAction(title: "Rectangle") { _ in
				self.setView(RectangleBezierView())
			},
			UIAction(title: "Tringle") { _ in
				self.setView(TriangleBezierView())
			},
		])
		popUpButton.showsMenuAsPrimaryAction = true
	}

	private func removeView() {
		guard let bezierView else { return }
		bezierView.removeFromSuperview()
		self.bezierView = nil
	}

	private func setView(_ view: UIView) {
		removeView()
		view.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(view)
		bezierView = view
		NSLayoutConstraint.activate([
			view.heightAnchor.constraint(equalToConstant: 160),
			view.widthAnchor.constraint(equalToConstant: 240),
			view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
			view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
		])
	}
}

