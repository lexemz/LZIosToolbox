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
	case arcShape
	case leftArcOfCircle
	case rectangleShape
	case triangleMask

	var view: UIView {
		switch self {
		case .rectangle: return RectangleBezierView()
		case .triangle: return TriangleBezierView()
		case .oval: return OvalBezierView()
		case .circle: return CircleBezierView()
		case .rectangleWithRoundedCorners: return RectangleWithRoundedCorners()
		case .rectangleWithHalfRoundedCorners: return RectangleWithHalfRoundedCorners()
		case .arcShape: return ArcShape()
		case .leftArcOfCircle: return LeftArcOfCircle()
		case .rectangleShape: return RectangleShape()
		case .triangleMask: return TriangleMask()
		}
	}
}
