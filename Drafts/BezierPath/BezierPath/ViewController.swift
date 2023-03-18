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
		let nothingAction = UIAction(title: "CLEAR") { _ in
			self.removeView()
		}
		nothingAction.attributes = .destructive
		let figureActions = Figure.allCases.map{ figure in
			UIAction(title: figure.rawValue) { _ in
				self.setView(figure.view)
			}
		}

		popUpButton.menu = UIMenu(children: [nothingAction] + figureActions)
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

