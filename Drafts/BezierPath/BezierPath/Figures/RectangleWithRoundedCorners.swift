//
//  RectangleWithRoundedCorners.swift
//  BezierPath
//
//  Created by Igor Buzykin on 17.03.2023.
//

import UIKit

final class RectangleWithRoundedCorners: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .gray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func draw(_ rect: CGRect) {
		createFigure()
	}

	private func createFigure() {
		let path = UIBezierPath(
			roundedRect: bounds,
			cornerRadius: 15.0
		)
		
		path.fillAndStroke()
	}
}

