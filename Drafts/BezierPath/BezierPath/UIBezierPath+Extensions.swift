//
//  UIBezierPath+Extensions.swift
//  BezierPath
//
//  Created by Igor Buzykin on 18.03.2023.
//

import UIKit

extension UIBezierPath {
	func fillAndStroke() {
		UIColor.blue.setFill()
		fill()

		UIColor.red.setStroke()
		stroke()
	}
}
