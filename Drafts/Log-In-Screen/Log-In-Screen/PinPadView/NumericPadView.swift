//
//  NumericPadView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 16.05.2023.
//

import UIKit

protocol NumericPadViewDelegate: AnyObject {
	func numericPad(_ numericPad: NumericPadView, didTapAt num: Int)
}

final class NumericPadView: UIView {

	weak var delegate: NumericPadViewDelegate?

	private enum Constants {
		static let horizontalSpacing: CGFloat = 10
		static let verticalSpacing: CGFloat = 5
	}

	private lazy var leftAccessoryContainer = UIView()
	private lazy var rightAccessoryContainer = UIView()

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
		stackView.spacing = Constants.verticalSpacing
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
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

// MARK: - Internal

extension NumericPadView {
	func setLeftAccessoryView(_ view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		leftAccessoryContainer.addSubview(view)
		let constraints = [
			view.topAnchor.constraint(equalTo: leftAccessoryContainer.topAnchor),
			view.leadingAnchor.constraint(equalTo: leftAccessoryContainer.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: leftAccessoryContainer.trailingAnchor),
			view.bottomAnchor.constraint(equalTo: leftAccessoryContainer.bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}

	func setRightAccessoryView(_ view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		rightAccessoryContainer.addSubview(view)
		let constraints = [
			view.topAnchor.constraint(equalTo: rightAccessoryContainer.topAnchor),
			view.leadingAnchor.constraint(equalTo: rightAccessoryContainer.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: rightAccessoryContainer.trailingAnchor),
			view.bottomAnchor.constraint(equalTo: rightAccessoryContainer.bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
}

// MARK: - Private

private extension NumericPadView {
	func setupUI() {
		addSubview(mainStack)
	}

	func setupConstraints() {
		let constraints = [
			mainStack.topAnchor.constraint(equalTo: topAnchor),
			mainStack.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStack.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStack.bottomAnchor.constraint(equalTo: bottomAnchor),
			leftAccessoryContainer.heightAnchor.constraint(equalTo: leftAccessoryContainer.widthAnchor,
														   multiplier: 1.0 / 1.0)
		]
		NSLayoutConstraint.activate(constraints)
	}

	@objc
	func numericButtonTap(sender: UIButton) {
		delegate?.numericPad(self, didTapAt: sender.tag)
	}
}

// MARK: - Subviews creation flow

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
			leftAccessoryContainer,
			createNumericButton(num: 0),
			rightAccessoryContainer
		]
		return createRowStackView(subviews: views)
	}

	func createNumericButton(num: Int) -> UIButton {
		let button = UIButton()
		button.setTitle(String(num), for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
		button.setTitleColor(.label, for: .normal)
		button.tag = num
		button.translatesAutoresizingMaskIntoConstraints = false
		button.addTarget(self, action: #selector(numericButtonTap(sender:)), for: .touchUpInside)
		return button
	}

	func createRowStackView(subviews: [UIView]) -> UIStackView {
		let stackView = UIStackView(arrangedSubviews: subviews)
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.spacing = Constants.horizontalSpacing
		return stackView
	}
}
