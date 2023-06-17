//
//  FormContentView.swift
//  ScrollView
//
//  Created by Igor Buzykin on 17.06.2023.
//

import UIKit

final class FormContentView: UIView {

	lazy var nameField: UITextField = {
		let textField = UITextField()

		textField.placeholder = "Name"
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()

	lazy var surnameField: UITextField = {
		let textField = UITextField()

		textField.placeholder = "Surname"
		textField.translatesAutoresizingMaskIntoConstraints = false
		return textField
	}()

	lazy var policyLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 0
		label.text = "Нажимая на кропку вы соглашаетесь продать душу Тиму Куку."
		return label
	}()
	private lazy var policyTopConstraint = policyLabel.topAnchor.constraint(
		equalTo: surnameField.bottomAnchor,
		constant: 20
	)
	private lazy var bolicyBottomConstraint = policyLabel.bottomAnchor.constraint(
		equalTo: bottomAnchor,
		constant: -20
	)

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		configureConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func updatePolicyPosition(isEditMode: Bool, withDuration duration: Double) {
		policyTopConstraint.isActive = isEditMode
		UIView.animate(withDuration: duration) {
			self.setNeedsLayout()
		}
	}
}

private extension FormContentView {
	func configureUI() {
		let subviews = [
			nameField,
			surnameField,
			policyLabel
		]

		subviews.forEach(addSubview(_:))
	}

	func configureConstraints() {
		NSLayoutConstraint.activate([
			nameField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

			surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 20),
			surnameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			surnameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

			policyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			policyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			bolicyBottomConstraint
		])
	}
}

