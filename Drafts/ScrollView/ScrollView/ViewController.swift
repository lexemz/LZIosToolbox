//
//  ViewController.swift
//  ScrollView
//
//  Created by Бузыкин Игорь Валерьевич on 16.06.2023.
//

import UIKit

class ViewController: UIViewController {

	private lazy var forecastView: ForeCastView = {
		let forecastView = ForeCastView()
		forecastView.translatesAutoresizingMaskIntoConstraints = false
		return forecastView
	}()

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.alwaysBounceVertical = true
		return scrollView
	}()

	private lazy var infoButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "info.circle"), for: .normal)
		button.tintColor = .systemBlue
		return button
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		configureUI()
		configureLayoutWithGuides()
		configureKeyboardObservers()
	}

	func configureUI() {
		title = "Scroll View Test"

		view.addSubview(scrollView)
		scrollView.addSubview(forecastView)
		scrollView.addSubview(infoButton)

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

	func configureLayoutWithGuides() {
		let frameGuide = scrollView.frameLayoutGuide
		let contentGuide = scrollView.contentLayoutGuide
		let layoutMarginsGuide = scrollView.layoutMarginsGuide

		NSLayoutConstraint.activate([
			frameGuide.topAnchor.constraint(equalTo: view.topAnchor),
			frameGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			frameGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			frameGuide.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			contentGuide.topAnchor.constraint(equalTo: forecastView.topAnchor),
			contentGuide.leadingAnchor.constraint(equalTo: forecastView.leadingAnchor),
			contentGuide.trailingAnchor.constraint(equalTo: forecastView.trailingAnchor),
			contentGuide.bottomAnchor.constraint(equalTo: forecastView.bottomAnchor),

			contentGuide.widthAnchor.constraint(equalTo: frameGuide.widthAnchor),

			infoButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 0),
			infoButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 0)
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
