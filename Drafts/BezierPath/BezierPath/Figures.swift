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

	var view: UIView {
		switch self {
		case .rectangle: return RectangleBezierView()
		case .triangle: return TriangleBezierView()
		}
	}
}
