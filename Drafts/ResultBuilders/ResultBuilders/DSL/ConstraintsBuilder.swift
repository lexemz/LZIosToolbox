//
//  ConstraintsBuilder.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 25.06.2023.
//

import UIKit

@resultBuilder
struct ConstraintsBuilder {

	/// Собрать массив коснтреинтов
	static func buildBlock(_ constraintsGroup: ConstraintsGroupRepresented...) -> [NSLayoutConstraint] {
		print("buildBlock(_ constraintsGroup: ConstraintsGroupRepresented...)")
		constraintsGroup.forEach { print($0.constraints) }
		print()

		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив констреинтов с возможностью **optional unwrap**
	static func buildOptional(_ constraintsGroup: [ConstraintsGroupRepresented]?) -> [NSLayoutConstraint] {
		print("buildOptional(_ constraintsGroup: [ConstraintsGroupRepresented]?)")
		constraintsGroup?.forEach { print($0.constraints) }
		print()

		return constraintsGroup?.flatMap { $0.constraints } ?? []
	}

	/// Собрать массив констреинтов с обработкой if condition
	static func buildEither(first constraintsGroup: [ConstraintsGroupRepresented]) -> [NSLayoutConstraint] {
		print("buildEither(first constraintsGroup: [ConstraintsGroupRepresented])")
		constraintsGroup.forEach { print($0.constraints) }
		print()
		
		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив констреинтов с обработкой else condition
	static func buildEither(second constraintsGroup: [ConstraintsGroupRepresented]) -> [NSLayoutConstraint] {
		print("buildEither(second constraintsGroup: [ConstraintsGroupRepresented])")
		constraintsGroup.forEach { print($0.constraints) }
		print()

		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив коснтреинтов на основе итерируемых коллекций
	static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
		print("buildArray(_ components: [[NSLayoutConstraint]])")
		components.forEach { print($0.constraints) }
		print()

		return components.flatMap { $0 }
	}
}

extension NSLayoutConstraint {
	static func activate(@ConstraintsBuilder constraints: () -> [NSLayoutConstraint]) {
		activate(constraints())
	}

	static func arrayOf(@ConstraintsBuilder constraints: () -> [NSLayoutConstraint]) -> [NSLayoutConstraint] {
		constraints()
	}
}

extension Array where Element == NSLayoutConstraint {
	/// Активировать массив констреинтов
	func activate() {
		NSLayoutConstraint.activate(self)
	}
}

extension UIView {
	func addSubviews(
		translatesAutoresizingMaskIntoConstraints: Bool = false,
		@ArrayBuilder subviews: () -> [UIView]
	) {
		subviews().forEach {
			$0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
			addSubview($0)
		}
	}
}
