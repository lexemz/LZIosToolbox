//
//  HapticHandler.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 22.05.2023.
//

import UIKit

enum HapticHandler {

	case notification(type: UINotificationFeedbackGenerator.FeedbackType)
	case feedback(style: UIImpactFeedbackGenerator.FeedbackStyle)

	func impact() {

		switch self {
		case let .notification(type):
			let generator = UINotificationFeedbackGenerator()
			generator.notificationOccurred(type)
		case let .feedback(style):
			let generator = UIImpactFeedbackGenerator(style: style)
			generator.impactOccurred()
		}
	}
}
