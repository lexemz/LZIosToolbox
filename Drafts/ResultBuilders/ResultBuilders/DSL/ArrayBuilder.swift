//
//  ArrayBuilder.swift
//  ResultBuilders
//
//  Created by Igor Buzykin on 25.06.2023.
//

import Foundation

@resultBuilder
struct ArrayBuilder {
	static func buildBlock<T>(_ components: T...) -> [T] {
		components
	}
}

extension Array {
	init(@ArrayBuilder arrayLiteral elements: () -> [Element]) {
		self.init(elements())
	}

	mutating func append(@ArrayBuilder arrayLiteral elements: () -> [Element]) {
		self += elements()
	}
}
