//
//  ConstraintsBuilder.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 25.06.2023.
//

import UIKit

@resultBuilder
struct ConstraintsBuilder {

	/// Собрать пустой массив констреинтов
	/// 
	/// - Returns: Массив констреинтов
	static func buildBlock() -> [NSLayoutConstraint] {
		[]
	}

	/// Собрать массив коснтреинтов
	///
	/// - Parameter constraints: Массивы констреинтов
	/// - Returns: Единый массив констреинтов
	static func buildBlock(_ constraints: [NSLayoutConstraint]...) -> [NSLayoutConstraint] {
		constraints.flatMap { $0 }
	}

	/// Обработчик одного констреинта
	///
	/// - Parameter singleConstraint: Констреинт
	/// - Returns: Массив констреинтов с единственным массивом
	static func buildExpression(_ singleConstraint: NSLayoutConstraint) -> [NSLayoutConstraint] {
		[singleConstraint]
	}

	/// Обработчик массива констреинтов
	///
	/// - Parameter severalConstraints: Несколько констреинтов
	/// - Returns: Массив из нескольных констреинтов
	static func buildExpression(_ severalConstraints: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
		severalConstraints
	}

	/// Собрать массив констреинтов с возможностью **optional unwrap**
	static func buildOptional(_ constraints: [NSLayoutConstraint]?) -> [NSLayoutConstraint] {
		constraints ?? []
	}

	/// Собрать массив констреинтов с обработкой if condition
	static func buildEither(first constraints: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
		constraints
	}

	/// Собрать массив констреинтов с обработкой else condition
	static func buildEither(second constraints: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
		constraints
	}

	/// Собрать массив коснтреинтов на основе итерируемых коллекций
	static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
		components.flatMap { $0 }
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
