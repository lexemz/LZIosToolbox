//
//  ArcShape.swift
//  BezierPath
//
//  Created by Igor Buzykin on 18.03.2023.
//

import UIKit

final class ArcShape: UIView {

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
			// центр окружности по которой идет дуга
			arcCenter: CGPoint(
				x: frame.width / 2,
				y: frame.height / 2
			),
			// радиус окружности
			radius: frame.height / 2,
			startAngle: .pi / 4,
			endAngle: .pi * 3 / 4,
			clockwise: false
		)

		path.fillAndStroke()
	}
}

