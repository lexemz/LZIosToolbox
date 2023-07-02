//
//  Chapter4_ViewControllers.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 02.07.2023.
//

import UIKit

final class ViewController_C4_1: UIViewController, Storyboarded {}
final class ViewController_C4_2: UIViewController, Storyboarded {}
final class ViewController_C4_3: UIViewController, Storyboarded {}

final class ViewController_C4_4: UIViewController, Storyboarded {
	@IBOutlet var verticalConstraint: NSLayoutConstraint!

	@IBAction func startButtonTapped() {
		verticalConstraint.constant = 0
		UIView.animate(withDuration: 0.3) {
			self.view.layoutIfNeeded()
		}
	}
}

