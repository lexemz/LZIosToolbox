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
	/// - Parameter groups: Группа констреинтов. В группе либо один, либо несколько констреинтов
	/// - Returns: Собранный массив констреинтов
	///
	/// ```swift
	/// let horizontalConstraints = [
	///     redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
	///     redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
	/// ]
	///
	/// NSLayoutConstraint.activate {
	///     redView.topAnchor.constraint(equalTo: view.topAnchor)
	///     redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
	///     horizontalConstraints
	/// }
	/// ````
	static func buildBlock(_ constraintsGroup: ConstraintsGroupRepresented...) -> [NSLayoutConstraint] {
		print("buildBlock(_ constraintsGroup: ConstraintsGroupRepresented...)\n", constraintsGroup)
		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив констреинтов с возможностью **optional unwrap**
	/// - Parameter component: Компоненты, которые могут быть **optional**
	/// - Returns: Собранный массив констреинтов
	///
	/// ```swift
	/// let verticalConstraints = [
	///     redView.topAnchor.constraint(equalTo: view.topAnchor),
	///     redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
	/// ]
	///
	/// let horizontalConstraints: [NSLayoutConstraint]? = [
	///     redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
	///     redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
	/// ]
	///
	/// NSLayoutConstraint.activate {
	///     verticalConstraints
	///
	///     if let horizontalConstraints {
	///         horizontalConstraints
	///     }
	/// }
	/// ```
	static func buildOptional(_ constraintsGroup: [ConstraintsGroupRepresented]?) -> [NSLayoutConstraint] {
		print("buildOptional(_ component: [ConstraintsGroupRepresented]?)")
		return constraintsGroup?.flatMap { $0.constraints } ?? []
	}

	/// Собрать массив констреинтов с обработкой if condition
	/// - Parameter component: Опциональная группа констреинтов
	/// - Returns: Собранный массив констреинтов
	///
	/// ```swift
	/// let predicate = true
	/// NSLayoutConstraint.activate {
	///     if predicate {
	///         // ↓ Responsible for this ↓
	///         view.heightAnchor.constraint(equalToConstant: 50)
	///     } else {
	///         view.heightAnchor.constraint(equalToConstant: 100)
	///     }
	/// }
	/// ```
	static func buildEither(first constraintsGroup: [ConstraintsGroupRepresented]) -> [NSLayoutConstraint] {
		print("buildEither(first constraintsGroup: [ConstraintsGroupRepresented])")
		print(constraintsGroup)
		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив констреинтов с обработкой else condition
	/// - Parameter component: Группа констреинтов. В группе либо один, либо несколько констреинтов
	/// - Returns: Собранный массив констреинтов
	///
	/// ```swift
	/// let predicate = true
	/// NSLayoutConstraint.activate {
	///     if predicate {
	///         view.heightAnchor.constraint(equalToConstant: 50)
	///     } else {
	///          // ↓ Responsible for this ↓
	///         view.heightAnchor.constraint(equalToConstant: 100)
	///     }
	/// }
	/// ```
	static func buildEither(second constraintsGroup: [ConstraintsGroupRepresented]) -> [NSLayoutConstraint] {
		print("buildEither(second constraintsGroup: [ConstraintsGroupRepresented])")
		print(constraintsGroup)
		return constraintsGroup.flatMap { $0.constraints }
	}

	/// Собрать массив коснтреинтов на основе итерируемых данных
	/// - Parameter components: Перебираемый массив с массивами констреинтов
	/// - Returns: Собранный массив констреинтов
	///
	/// ````
	/// let verticalConstraints = [
	///     redView.topAnchor.constraint(equalTo: view.topAnchor),
	///     redView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
	/// ]
	///
	/// let horizontalConstraints = [
	///     redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
	///     redView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
	/// ]
	///
	/// NSLayoutConstraint.activate {
	///     let allConstraints = [verticalConstraints, horizontalConstraints]
	///     for constraints in allConstraints {
	///         constraints
	///     }
	/// }
	/// ````
	static func buildArray(_ components: [[NSLayoutConstraint]]) -> [NSLayoutConstraint] {
		print("buildArray(_ components: [[NSLayoutConstraint]])")
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
