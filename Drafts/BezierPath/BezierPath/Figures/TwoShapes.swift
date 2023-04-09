//
//  TwoShapes.swift
//  BezierPath
//
//  Created by Igor Buzykin on 26.03.2023.
//

import UIKit

final class TwoShapes: UIView {

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
		let halfX = frame.size.width / 2
		let halfY = frame.size.height / 2

		let path1 = UIBezierPath()
		path1.move(to: .zero)
		path1.addLine(to: CGPoint(x: halfX, y: 0))
		path1.addLine(to: CGPoint(x: halfX / 2, y: halfY))
		path1.close()
		let shapeLayer1 = CAShapeLayer()
		shapeLayer1.path = path1.cgPath
		shapeLayer1.fillColor = UIColor.blue.cgColor
		shapeLayer1.strokeColor = UIColor.red.cgColor

		let path2 = UIBezierPath()
		path2.move(to: CGPoint(x: halfX / 2, y: 0))
		path2.addLine(to: CGPoint(x: halfX, y: halfY))
		path2.addLine(to: CGPoint(x: 0, y: halfY))
		path2.close()
		let shapeLayer2 = CAShapeLayer()
		shapeLayer2.path = path2.cgPath
		shapeLayer2.fillColor = UIColor.cyan.cgColor
		shapeLayer2.strokeColor = UIColor.yellow.cgColor

		// Контроль позиции
		shapeLayer1.position = CGPoint(x: halfX / 2, y: halfY)
		shapeLayer2.position = CGPoint(x: halfX / 2, y: 0)

		[shapeLayer1, shapeLayer2].forEach {
			shapeLayers.append($0)
			layer.addSublayer($0)
		}
	}
}
