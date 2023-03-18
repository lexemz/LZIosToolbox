//
//  RectangleWithHalfRoundedCorners.swift
//  BezierPath
//
//  Created by Igor Buzykin on 17.03.2023.
//

import UIKit

final class RectangleWithHalfRoundedCorners: UIView {

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
			byRoundingCorners: [.topLeft, .bottomRight],
			cornerRadii: CGSize(width: 40, height: 0) // height тут игнорируется
		)
		
		path.fillAndStroke()
	}
}

