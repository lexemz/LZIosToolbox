//
//  DispatchQueue+Extensions.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 23.05.2023.
//

import Foundation

extension DispatchQueue {
	func delay(_ time: Double, completion: @escaping () -> Void) {
		asyncAfter(deadline: .now() + time) {
			completion()
		}
	}
}
