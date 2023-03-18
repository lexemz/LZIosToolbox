//
//  TriangleBezierView.swift
//  BezierPath
//
//  Created by Igor Buzykin on 13.03.2023.
//

import UIKit

class TriangleBezierView: UIView {

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
		let path = UIBezierPath()

		path.move(to: CGPoint(x: frame.width / 2, y: 0))
		path.addLine(to: CGPoint(x: 0.0, y: frame.size.height))
		path.addLine(to: CGPoint(x: frame.width, y: frame.height))
		path.close()
		
		path.fillAndStroke()
	}
}
