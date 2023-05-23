//
//  PinPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 21.05.2023.
//

import UIKit

final class PinPadView: UIView {

	private let pin = "111222"
	private var currentPin = ""

	private lazy var rightAdditionalButton: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(systemName: "delete.backward.fill"), for: .normal)
		button.addTarget(self, action: #selector(rightButtonDidTap), for: .touchUpInside)
		button.tintColor = .label
		return button
	}()

	private lazy var numericPadView: NumericPadView = {
		let numPadView = NumericPadView()
		numPadView.delegate = self
		numPadView.translatesAutoresizingMaskIntoConstraints = false
		return numPadView
	}()

	private lazy var dotIndicatorView: DotIndicatorView = {
		let dotIndicatorView = DotIndicatorView(dotsCount: 6)
		dotIndicatorView.delegate = self
		dotIndicatorView.translatesAutoresizingMaskIntoConstraints = false
		return dotIndicatorView
	}()

	override init(frame: CGRect) {
		super.init(frame: .zero)
		setupUI()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension PinPadView: NumericPadViewDelegate {
	func numericPad(_ numericPad: NumericPadView, didTapAt num: Int) {
		HapticHandler.feedback(style: .medium).impact()
		currentPin += String(num)
		dotIndicatorView.activateNextDot()
	}
}

extension PinPadView: DotIndicatorViewDelegate {

	func indicatorViewDidFilled(_ indicatorView: DotIndicatorView) {
		if pin == currentPin {
			dotIndicatorView.showSuccess()
		} else {
			dotIndicatorView.showError()
		}
		currentPin = ""
	}
}

private extension PinPadView {

	@objc
	func rightButtonDidTap() {
		if dotIndicatorView.isFill { dotIndicatorView.resetStatus() }
		guard !currentPin.isEmpty else { return }
		currentPin.removeLast()
		dotIndicatorView.deactivatePreviousDot()
	}

	func setupUI() {
		[dotIndicatorView, numericPadView].forEach(addSubview(_:))
		numericPadView.setRightAccessoryView(rightAdditionalButton)
	}

	func setupConstraints() {
		let constraints = [
			numericPadView.topAnchor.constraint(equalTo: topAnchor),
			numericPadView.leadingAnchor.constraint(equalTo: leadingAnchor),
			numericPadView.trailingAnchor.constraint(equalTo: trailingAnchor),
			numericPadView.bottomAnchor.constraint(equalTo: bottomAnchor),

			dotIndicatorView.centerXAnchor.constraint(equalTo: numericPadView.centerXAnchor),
			dotIndicatorView.bottomAnchor.constraint(equalTo: numericPadView.topAnchor, constant: -30)
		]
		NSLayoutConstraint.activate(constraints)
	}
}
