//
//  TriangleMask.swift
//  BezierPath
//
//  Created by Igor Buzykin on 26.03.2023.
//

import UIKit

final class TriangleMask: UIView {

	var shapeLayer: CAShapeLayer?

	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .gray
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		shapeLayer?.removeFromSuperlayer()
		createShapeLayer()
	}

	func createShapeLayer() {

		// Создаем фигуру квадрат
		let path = UIBezierPath()
		path.move(to: .zero)
		path.addLine(to: CGPoint(x: 0.0, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.size.width, y: 0.0))
		path.close()

		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.cyan.cgColor
		shapeLayer.strokeColor = UIColor.red.cgColor
		shapeLayer.lineWidth = 3.0
		self.shapeLayer = shapeLayer
		layer.addSublayer(shapeLayer)

		// Создаем маску в виде фигуры треугольника и накладываем на слой
		let maskPath = UIBezierPath()
		maskPath.move(to: CGPoint(x: frame.width / 2, y: 0))
		maskPath.addLine(to: CGPoint(x: 0.0, y: frame.size.height))
		maskPath.addLine(to: CGPoint(x: frame.width, y: frame.height))
		maskPath.close()

		let maskShapeLayer = CAShapeLayer()
		maskShapeLayer.path = maskPath.cgPath

		shapeLayer.mask = maskShapeLayer
	}
}
