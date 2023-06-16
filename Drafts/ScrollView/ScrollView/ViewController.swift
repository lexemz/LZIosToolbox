//
//  ViewController.swift
//  ScrollView
//
//  Created by Бузыкин Игорь Валерьевич on 16.06.2023.
//

import UIKit

class ViewController: UIViewController {

	let forecastView: ForeCastView = {
		let forecastView = ForeCastView()
		forecastView.translatesAutoresizingMaskIntoConstraints = false
		return forecastView
	}()

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.addSubview(forecastView)
		return scrollView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		configureLayout()
		configureKeyboardObservers()
	}

	func configureUI() {
		view.addSubview(scrollView)
		scrollView.addSubview(forecastView)

		forecastView.setupView(
			title: "Hellow friend",
			image: UIImage(named: "image")!,
			summaryLabel: "Hello world"
		)
	}

	func configureLayout() {
		NSLayoutConstraint.activate([
			// Скролл вью к супервью
			scrollView.topAnchor.constraint(equalTo: view.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			scrollView.topAnchor.constraint(equalTo: forecastView.topAnchor),
			scrollView.leadingAnchor.constraint(equalTo: forecastView.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: forecastView.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: forecastView.bottomAnchor),

			forecastView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
		])
	}
}

// MARK: - Keyboard Handling

private extension ViewController {

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
			let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
		else { return }
		let keyboardSize = keyboardFrame.cgRectValue
		let keyboardHeight = keyboardSize.height

	}

	@objc
	func keyboardWillHideNotification(_ notification: NSNotification) {

	}
}
