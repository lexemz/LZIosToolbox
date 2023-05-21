//
//  NumericPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 16.05.2023.
//

import UIKit

final class NumericPadView: UIView {

	private enum Constants {
		static let borderInsets: CGFloat = 5

		static let betweenInsets: CGFloat = 10
	}

	private lazy var numericButtons: [UIButton] = {
		[
			createNumericButton(num: 0),
			createNumericButton(num: 1),
			createNumericButton(num: 2),
			createNumericButton(num: 3),
			createNumericButton(num: 4),
			createNumericButton(num: 5),
			createNumericButton(num: 6),
			createNumericButton(num: 7),
			createNumericButton(num: 8),
			createNumericButton(num: 9)
		]
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
		(numericButtons).forEach(addSubview(_:))
	}

	func setupConstraints() {
		let constraints = createConstraintsForFirstRow()
		+ createConstraintsForSecondRow()
		+ createConstraintsForThridRow()
		+ createConstraintsForFourRow()
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
	func createNumericButton(num: Int) -> UIButton {
		let button = UIButton()
		button.setTitle(String(num), for: .normal)
		button.tag = num
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(numericButtonTap(sender:)), for: .touchUpInside)
		button.backgroundColor = .gray
		return button
	}

	func createConstraintsForFirstRow() -> [NSLayoutConstraint] {
		let buttonOne = numericButtons[1]
		let buttonTwo = numericButtons[2]
		let buttonThree = numericButtons[3]

		let constraints = [
			buttonOne.topAnchor.constraint(equalTo: topAnchor, constant: Constants.borderInsets),
			buttonTwo.topAnchor.constraint(equalTo: topAnchor, constant: Constants.borderInsets),
			buttonThree.topAnchor.constraint(equalTo: topAnchor, constant: Constants.borderInsets),

			buttonOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderInsets),
			buttonTwo.leadingAnchor.constraint(equalTo: buttonOne.trailingAnchor, constant: Constants.betweenInsets),
			buttonThree.leadingAnchor.constraint(equalTo: buttonTwo.trailingAnchor, constant: Constants.betweenInsets),
			buttonThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.borderInsets),

			buttonOne.heightAnchor.constraint(equalTo: buttonOne.widthAnchor, multiplier: 1.0 / 1.0),
			buttonTwo.heightAnchor.constraint(equalTo: buttonOne.heightAnchor),
			buttonTwo.widthAnchor.constraint(equalTo: buttonOne.widthAnchor),
			buttonThree.heightAnchor.constraint(equalTo: buttonOne.heightAnchor),
			buttonThree.widthAnchor.constraint(equalTo: buttonOne.widthAnchor),
		]

		return constraints
	}

	func createConstraintsForSecondRow() -> [NSLayoutConstraint] {
		let buttonFour = numericButtons[4]
		let buttonFive = numericButtons[5]
		let buttonSix = numericButtons[6]

		let buttonFirst = numericButtons[1]
		let topAnchor = buttonFirst.bottomAnchor

		let constraints = [
			buttonFour.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),
			buttonFive.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),
			buttonSix.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),

			buttonFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderInsets),
			buttonFive.leadingAnchor.constraint(equalTo: buttonFour.trailingAnchor, constant: Constants.betweenInsets),
			buttonSix.leadingAnchor.constraint(equalTo: buttonFive.trailingAnchor, constant: Constants.betweenInsets),
			buttonSix.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.borderInsets),

			buttonFour.heightAnchor.constraint(equalTo: buttonFirst.heightAnchor),
			buttonFour.widthAnchor.constraint(equalTo: buttonFirst.widthAnchor),
			buttonFive.heightAnchor.constraint(equalTo: buttonFirst.heightAnchor),
			buttonFive.widthAnchor.constraint(equalTo: buttonFirst.widthAnchor),
			buttonSix.heightAnchor.constraint(equalTo: buttonFirst.heightAnchor),
			buttonSix.widthAnchor.constraint(equalTo: buttonFirst.widthAnchor)
		]

		return constraints
	}

	func createConstraintsForThridRow() -> [NSLayoutConstraint] {
		let buttonSeven = numericButtons[7]
		let buttonEight = numericButtons[8]
		let buttonNine = numericButtons[9]

		let buttonFour = numericButtons[4]
		let topAnchor = buttonFour.bottomAnchor

		let constraints = [
			buttonSeven.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),
			buttonEight.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),
			buttonNine.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),

			buttonSeven.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.borderInsets),
			buttonEight.leadingAnchor.constraint(equalTo: buttonSeven.trailingAnchor, constant: Constants.betweenInsets),
			buttonNine.leadingAnchor.constraint(equalTo: buttonEight.trailingAnchor, constant: Constants.betweenInsets),
			buttonNine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.borderInsets),

			buttonSeven.heightAnchor.constraint(equalTo: buttonFour.heightAnchor),
			buttonSeven.widthAnchor.constraint(equalTo: buttonFour.widthAnchor),
			buttonEight.heightAnchor.constraint(equalTo: buttonFour.heightAnchor),
			buttonEight.widthAnchor.constraint(equalTo: buttonFour.widthAnchor),
			buttonNine.heightAnchor.constraint(equalTo: buttonFour.heightAnchor),
			buttonNine.widthAnchor.constraint(equalTo: buttonFour.widthAnchor)
		]

		return constraints
	}

	func createConstraintsForFourRow() -> [NSLayoutConstraint] {
		let buttonZero = numericButtons[0]

		let buttonEight = numericButtons[8]
		let topAnchor = buttonEight.bottomAnchor

		let constraints = [
			buttonZero.topAnchor.constraint(equalTo: topAnchor, constant: Constants.betweenInsets),
			buttonZero.centerXAnchor.constraint(equalTo: buttonEight.centerXAnchor),
			buttonZero.heightAnchor.constraint(equalTo: buttonEight.heightAnchor),
			buttonZero.widthAnchor.constraint(equalTo: buttonEight.widthAnchor),
			buttonZero.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.borderInsets)
		]

		return constraints
	}
}
