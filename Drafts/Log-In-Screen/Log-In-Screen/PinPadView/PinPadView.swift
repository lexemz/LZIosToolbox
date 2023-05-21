//
//  PinPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 21.05.2023.
//

import UIKit

final class PinPadView: UIView {

	private lazy var numericPadView: NumericPadView = {
		let view = NumericPadView()
		view.delegate = self
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
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
		print(#function, num)
	}
}

private extension PinPadView {
	func setupUI() {
		addSubview(numericPadView)
	}

	func setupConstraints() {
		let constraints = [
			numericPadView.topAnchor.constraint(equalTo: topAnchor),
			numericPadView.leadingAnchor.constraint(equalTo: leadingAnchor),
			numericPadView.trailingAnchor.constraint(equalTo: trailingAnchor),
			numericPadView.bottomAnchor.constraint(equalTo: bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
}
