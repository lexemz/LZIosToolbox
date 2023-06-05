//
//  CustomView.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 29.05.2023.
//

import UIKit

@IBDesignable
final class CustomView: UIView {

	@IBInspectable
	var padding: CGFloat = 25 {
		didSet {
			setNeedsLayout()
		}
	}

	private let redView: UIView = {
		let view = UIView()
		view.backgroundColor = .red
		return view
	}()

	private let blueView: UIView = {
		let view = UIView()
		view.backgroundColor = .blue
		return view
	}()


	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupView()
	}

	override func layoutSubviews() {
		super.layoutSubviews()
		setupLayoutManually()
	}

	private func setupView() {
		[redView, blueView].forEach {
			self.addSubview($0)
		}
	}

	private func setupLayoutManually() {
		let superWidth = bounds.width
		let superHeight = bounds.height

		let numberOfItems: CGFloat = 2
		let itemWidth = (superWidth - (numberOfItems + 1) * padding) / numberOfItems
		let itemHeight = superHeight - 2 * padding

		blueView.frame = CGRect(x: padding, y: padding, width: itemWidth, height: itemHeight)
		redView.frame = CGRect(x: padding * 2 + itemWidth, y: padding, width: itemWidth, height: itemHeight)
	}
}
