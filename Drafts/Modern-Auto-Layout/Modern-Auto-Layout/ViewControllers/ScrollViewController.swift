//
//  ScrollViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 15.06.2023.
//

import UIKit

final class ScrollViewController: UIViewController {

	private lazy var contentView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .gray
		return view
	}()

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.backgroundColor = .red
		scrollView.bounces = true
		return scrollView
	}()

	private lazy var textField1: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.backgroundColor = .green
		return textField
	}()

	private lazy var textField2: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.backgroundColor = .green
		return textField
	}()


	private lazy var continueButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Continue", for: .normal)
		button.backgroundColor = .black
		return button
	}()
	private lazy var continueButtonBottomConstraint = continueButton.bottomAnchor.constraint(
		equalTo: view.safeAreaLayoutGuide.bottomAnchor,
		constant: -20
	)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		configureUI()
		configureLayout()
		configureNotifications()
	}
}

private extension ScrollViewController {
	func configureUI() {
		view.addSubview(scrollView)
		view.addSubview(continueButton)

		scrollView.addSubview(contentView)
		scrollView.addSubview(textField1)
		scrollView.addSubview(textField2)
	}

	func configureLayout() {
		let safeArea = view.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),

			textField1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
			textField1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			textField1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

			textField2.topAnchor.constraint(equalTo: textField1.bottomAnchor, constant: 20),
			textField2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			textField2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

			continueButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
			continueButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
			continueButtonBottomConstraint,
		])
	}

	func configureNotifications() {
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(keyboardWillShow),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(keyboardWillHide),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		moveViewWithKeyboard(notification: notification, viewBottomConstraint: continueButtonBottomConstraint, keyboardWillShow: true)
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		moveViewWithKeyboard(notification: notification, viewBottomConstraint: continueButtonBottomConstraint, keyboardWillShow: false)
	}

	func moveViewWithKeyboard(notification: NSNotification, viewBottomConstraint: NSLayoutConstraint, keyboardWillShow: Bool) {
		// Keyboard's size
		guard
			let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
			let keyboardDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
			let keyboardAnimationCurve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
		else { return }
		let keyboardHeight = keyboardSize.height

		// Keyboard's animation duration
		let keyboardCurve = UIView.AnimationCurve(rawValue: keyboardAnimationCurve)!

		// Keyboard's animation curve

		if keyboardWillShow {
			viewBottomConstraint.constant = -keyboardHeight + 10
		} else {
			let safeArea = view?.window?.safeAreaInsets.bottom
			viewBottomConstraint.constant = -20
		}

		// Animate the view the same way the keyboard animates
		let animator = UIViewPropertyAnimator(duration: keyboardDuration, curve: keyboardCurve) { [weak self] in
			// Update Constraints
			self?.view.layoutIfNeeded()
		}

		// Perform the animation
		animator.startAnimation()
	}
}

