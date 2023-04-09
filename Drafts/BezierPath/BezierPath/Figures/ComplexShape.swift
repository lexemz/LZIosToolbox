//
//  ComplexShape.swift
//  BezierPath
//
//  Created by Igor Buzykin on 09.04.2023.
//

import UIKit

final class ComplexShape: UIView {

	var shapeLayers: [CAShapeLayer?] = []

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .gray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		shapeLayers.forEach { $0?.removeFromSuperlayer() }
		createShapeLayer()
	}

	// Вызвать, когда фрейм вью извествен
	func createShapeLayer() {
		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: self.frame.size.width/2 - 50.0, y: 0.0))
		path.addArc(withCenter: CGPoint(x: self.frame.size.width/2 - 25.0, y: 25.0),
					radius: 25.0,
					startAngle: .pi,
					endAngle: 0,
					clockwise: false)
		path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
		path.addLine(to: CGPoint(x: self.frame.size.width - 50.0, y: 0.0))
		path.addCurve(to: CGPoint(x: self.frame.size.width, y: 50.0),
					  controlPoint1: CGPoint(x: self.frame.size.width + 50.0, y: 25.0),
					  controlPoint2: CGPoint(x: self.frame.size.width - 150.0, y: 50.0))
		path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
		path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
		path.close()

		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.cyan.cgColor
		shapeLayer.strokeColor = UIColor.red.cgColor

		layer.addSublayer(shapeLayer)
	}
}
