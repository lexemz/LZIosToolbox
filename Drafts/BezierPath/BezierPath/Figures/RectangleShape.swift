//
//  RectangleShape.swift
//  BezierPath
//
//  Created by Бузыкин Игорь Валерьевич on 20.03.2023.
//

import UIKit

final class RectangleShape: UIView {

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
	}
}
