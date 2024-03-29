//
//  FormViewController.swift
//  ScrollView
//
//  Created by Igor Buzykin on 17.06.2023.
//

import UIKit

class FormViewController: UIViewController {

	enum Constants: CGFloat {
		case buttonHeight = 50
		case buttonBottomDefaultInset = -10
	}

	private var formContentViewHeightConstraint: NSLayoutConstraint!
	let formContentView: FormContentView = {
		let formContentView = FormContentView()
		formContentView.translatesAutoresizingMaskIntoConstraints = false
		return formContentView
	}()

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.addSubview(formContentView)
		scrollView.alwaysBounceVertical = true
		scrollView.keyboardDismissMode = .interactive
		return scrollView
	}()

	private var continueButtonBottomConstraint: NSLayoutConstraint!

	private lazy var continueButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setTitle("Continue", for: .normal)
		button.backgroundColor = .black
		button.layer.cornerRadius = 10
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		configureLayoutWithGuides()
		configureKeyboardObservers()
	}

	func configureUI() {
		view.backgroundColor = .systemBackground
		title = "Scroll View Test"

		view.addSubview(scrollView)
		scrollView.addSubview(formContentView)
		view.addSubview(continueButton)
	}

	func configureLayoutWithGuides() {
		let frameGuide = scrollView.frameLayoutGuide
		let contentGuide = scrollView.contentLayoutGuide
		let layoutMarginsGuide = scrollView.layoutMarginsGuide

		continueButtonBottomConstraint =  continueButton.bottomAnchor.constraint(
			equalTo: view.safeAreaLayoutGuide.bottomAnchor,
			constant: Constants.buttonBottomDefaultInset.rawValue
		)

		formContentViewHeightConstraint = formContentView.heightAnchor.constraint(
			equalTo: layoutMarginsGuide.heightAnchor,
			constant: -Constants.buttonHeight.rawValue
		)

		NSLayoutConstraint.activate([
			frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
			frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			contentGuide.topAnchor.constraint(equalTo: formContentView.topAnchor),
			contentGuide.leadingAnchor.constraint(equalTo: formContentView.leadingAnchor),
			contentGuide.trailingAnchor.constraint(equalTo: formContentView.trailingAnchor),
			contentGuide.bottomAnchor.constraint(equalTo: formContentView.bottomAnchor),

			contentGuide.widthAnchor.constraint(equalTo: layoutMarginsGuide.widthAnchor),
			formContentViewHeightConstraint,

			continueButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
			continueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
			continueButtonBottomConstraint,
			continueButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight.rawValue)
		])
	}
}

// MARK: - Keyboard Handling

private extension FormViewController {

	func configureKeyboardObservers() {
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(self,
									   selector: #selector(keyboardWillShowNotification),
									   name: UIWindow.keyboardWillShowNotification,
									   object: nil)
		notificationCenter.addObserver(self,
									   selector: #selector(keyboardWillHideNotification),
									   name: UIWindow.keyboardWillHideNotification,
									   object: nil)
	}

	@objc
	func keyboardWillShowNotification(_ notification: NSNotification) {
		guard
			let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
			let keyboardDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
		else { return }
		let keyboardSize = keyboardFrame.cgRectValue
		let keyboardHeight = keyboardSize.height
		scrollView.contentInset = UIEdgeInsets(
			top: 0,
			left: 0,
			bottom: keyboardHeight + view.safeAreaInsets.bottom,
			right: 0
		)
		scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(
			top: 0,
			left: 0,
			bottom: keyboardHeight - view.safeAreaInsets.bottom,
			right: 0
		)
		formContentViewHeightConstraint.isActive = false
		continueButtonBottomConstraint.constant = -keyboardHeight + view.safeAreaInsets.bottom - 10
		UIView.animate(withDuration: keyboardDuration) {
			self.view.layoutIfNeeded()
		}
	}

	@objc
	func keyboardWillHideNotification(_ notification: NSNotification) {
		guard
			let keyboardDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double
		else { return }

		scrollView.contentInset = .zero
		scrollView.scrollIndicatorInsets = .zero
		formContentViewHeightConstraint.isActive = true
		continueButtonBottomConstraint.constant = Constants.buttonBottomDefaultInset.rawValue
		UIView.animate(withDuration:keyboardDuration) {
			self.view.layoutIfNeeded()
		}
	}
}
