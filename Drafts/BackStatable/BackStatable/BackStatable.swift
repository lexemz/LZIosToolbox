//
//  BackStatable.swift
//  BackStatable
//
//  Created by Igor Buzykin on 03.07.2023.
//

import Foundation



@propertyWrapper
struct BackStatable<T> where T: Equatable {
	var wrappedValue: T {
		didSet {
			previousValue = oldValue
		}
	}

	private(set) var previousValue: T?

	var isValueChanged: Bool {
		wrappedValue == previousValue
	}

	init(wrappedValue: T) {
		self.wrappedValue = wrappedValue
	}
}
