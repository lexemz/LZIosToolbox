//
//  RectangleBezierView.swift
//  BezierPath
//
//  Created by Igor Buzykin on 12.03.2023.
//

import UIKit

class RectangleBezierView: UIView {

	var path: UIBezierPath!

	init() {
		super.init(frame: .zero)
		backgroundColor = .darkGray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func draw(_ rect: CGRect) {
		createFigure()
	}

	private func createFigure() {
		path = UIBezierPath()

		path.move(to: .zero)
		path.addLine(to: CGPoint(x: 0.0, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: 0.0))
		path.close()

		UIColor.orange.setFill()
		path.fill()

		UIColor.cyan.setStroke()
		path.stroke()
	}
}
