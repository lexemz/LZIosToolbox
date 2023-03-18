//
//  CircleBezierView.swift
//  BezierPath
//
//  Created by Igor Buzykin on 17.03.2023.
//

import UIKit

final class CircleBezierView: UIView {

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
			ovalIn: CGRect(
				x: frame.width/2 - frame.height/2,
				y: 0.0,
				width: frame.height,
				height: frame.height)
		)
		
		path.fillAndStroke()
	}
}

