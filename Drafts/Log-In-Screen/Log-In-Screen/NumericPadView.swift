//
//  NumericPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 16.05.2023.
//

import UIKit

final class NumericPadView: UIView {

	private lazy var mainStack: UIStackView = {
		let rows = [
			createFirstRow(),
			createSecondRow(),
			createThirdRow(),
			createFourthRow()
		]
		let stackView = UIStackView(arrangedSubviews: rows)
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private lazy var cleanButton: UIButton = {
		let button = UIButton()
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(clearButtonTap), for: .touchUpInside)
		button.backgroundColor = .gray
		return button
	}()

	init() {
		super.init(frame: .zero)
		setupUI()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension NumericPadView {
	func setupUI() {
		addSubview(mainStack)
	}

	func setupConstraints() {
		var constraints = [
			mainStack.topAnchor.constraint(equalTo: topAnchor),
			mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStack.bottomAnchor.constraint(equalTo: bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}

	@objc
	func numericButtonTap(sender: UIButton) {
		print(sender.tag)
	}

	@objc
	func clearButtonTap() {
		print("Clear tap")
	}
}

// MARK: - Private

private extension NumericPadView {
	func createFirstRow() -> UIStackView {
		let buttons = [
			createNumericButton(num: 1),
			createNumericButton(num: 2),
			createNumericButton(num: 3)
		]
		return createRowStackView(subviews: buttons)
	}

	func createSecondRow() -> UIStackView {
		let buttons = [
			createNumericButton(num: 4),
			createNumericButton(num: 5),
			createNumericButton(num: 6)
		]
		return createRowStackView(subviews: buttons)
	}

	func createThirdRow() -> UIStackView {
		let buttons = [
			createNumericButton(num: 7),
			createNumericButton(num: 8),
			createNumericButton(num: 9)
		]
		return createRowStackView(subviews: buttons)
	}

	func createFourthRow() -> UIStackView {
		let views = [
			UIView(),
			createNumericButton(num: 0),
			cleanButton
		]
		return createRowStackView(subviews: views)
	}

	func createNumericButton(num: Int) -> UIButton {
		let button = UIButton()
		button.setTitle(String(num), for: .normal)
		button.tag = num
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(numericButtonTap(sender:)), for: .touchUpInside)
		button.backgroundColor = .gray

		if num == 1 {
			NSLayoutConstraint.activate([
				button.heightAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1.0 / 1.0)
			])
		}
		return button
	}

	func createRowStackView(subviews: [UIView]) -> UIStackView {
		let stackView = UIStackView(arrangedSubviews: subviews)
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = 10
		return stackView
	}
}
