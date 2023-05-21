//
//  PinPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 21.05.2023.
//

import UIKit

final class PinPadView: UIView {

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
//		print(#function, num)

		if num == 1 {
			dotIndicatorView.activateNextDot()
		}
		if num == 2 {
			dotIndicatorView.deactivatePreviousDot()
		}
		if num == 3 {
			dotIndicatorView.showError()
		}
	}
}

extension PinPadView: DotIndicatorViewDelegate {
	func indicatorViewDidFilled(_ indicatorView: DotIndicatorView) {
		print(#function)
	}
}

private extension PinPadView {
	func setupUI() {
		[dotIndicatorView, numericPadView].forEach(addSubview(_:))
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
