//
//  ConstraintsGroup.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 25.06.2023.
//

import UIKit

/// Протокол для репрезентации `NSLayoutConstraint` и `[NSLayoutConstraint]` в виде одной сущности
protocol ConstraintsGroupRepresented {
	var constraints: [NSLayoutConstraint] { get }
}

extension NSLayoutConstraint: ConstraintsGroupRepresented {
	var constraints: [NSLayoutConstraint] { [self] }
}

extension Array: ConstraintsGroupRepresented where Element == NSLayoutConstraint {
	var constraints: [NSLayoutConstraint] { self }
}
