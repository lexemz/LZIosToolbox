//
//  Figures.swift
//  BezierPath
//
//  Created by Бузыкин Игорь Валерьевич on 17.03.2023.
//

import UIKit

enum Figure: String, CaseIterable {
	case rectangle
	case triangle
	case oval
	case circle
	case rectangleWithRoundedCorners
	case rectangleWithHalfRoundedCorners

	var view: UIView {
		switch self {
		case .rectangle: return RectangleBezierView()
		case .triangle: return TriangleBezierView()
		case .oval: return OvalBezierView()
		case .circle: return CircleBezierView()
		case .rectangleWithRoundedCorners: return RectangleWithRoundedCorners()
		case .rectangleWithHalfRoundedCorners: return RectangleWithHalfRoundedCorners()
		}
	}
}
