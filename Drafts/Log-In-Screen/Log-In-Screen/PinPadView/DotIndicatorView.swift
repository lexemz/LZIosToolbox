//
//  DotIndicatorView.swift
//  Log-In-Screen
//
//  Created by Igor Buzykin on 21.05.2023.
//

import UIKit

protocol DotIndicatorViewDelegate: AnyObject {
	func indicatorViewDidFilled(_ indicatorView: DotIndicatorView)
}

final class DotIndicatorView: UIView {

	weak var delegate: DotIndicatorViewDelegate?

	private enum Constants {
		static let dotHeight: CGFloat = 15
	}

	private var dots: [UIView] = []

	private var activeDotsCount = 0
	private(set) var isFill = false

	private lazy var dotsStackView: UIStackView = {
		let stackView = UIStackView(arrangedSubviews: dots)
		stackView.axis = .horizontal
		stackView.spacing = 20
		stackView.distribution = .fillEqually
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	init(dotsCount: Int) {
		super.init(frame: .zero)
		self.dots = createDots(count: dotsCount)
		setupUI()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Internal

extension DotIndicatorView {

	func activateNextDot() {
		if isFill { resetStatus() }
		guard activeDotsCount < dots.count else { return }
		dots[activeDotsCount].chageColor(.systemBlue)
		if activeDotsCount == dots.count - 1 {
			delegate?.indicatorViewDidFilled(self)
			isFill = true
		}
		activeDotsCount += 1	}

	func deactivatePreviousDot() {
		if isFill { resetStatus() }
		guard activeDotsCount > 0 else { return }
		activeDotsCount -= 1
		dots[activeDotsCount].chageColor(.systemGray3)
	}

	func showError() {
		dots.forEach { $0.chageColor(.systemRed) }
		HapticHandler.notification(type: .error).impact()
		dotsStackView.shake()
	}

	func showSuccess() {
		dots.forEach { $0.chageColor(.systemGreen) }
		HapticHandler.notification(type: .success).impact()
	}

	func resetStatus() {
		dots.forEach { $0.chageColor(.systemGray3) }
		isFill = false
		activeDotsCount = 0
	}
}

// MARK: - Private

private extension DotIndicatorView {
	func createDots(count: Int) -> [UIView] {
		(0 ..< count).map { _ in
			let view = UIView()
			view.backgroundColor = .systemGray3
			view.layer.cornerRadius = Constants.dotHeight / 2
			return view
		}
	}

	func setupUI() {
		addSubview(dotsStackView)
	}

	func setupConstraints() {
		let constraints = [
			dots[0].heightAnchor.constraint(equalTo: dots[0].widthAnchor),
			dots[0].widthAnchor.constraint(equalToConstant: Constants.dotHeight),
			dotsStackView.topAnchor.constraint(equalTo: topAnchor),
			dotsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			dotsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			dotsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
}

fileprivate extension UIView {
	func shake() {
		let shakeAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		shakeAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
		shakeAnimation.duration = 0.6
		shakeAnimation.values = [-20, 20, -16, 16, -12, 12, -8, 8, -4, 4, 0]
		layer.add(shakeAnimation, forKey: "shakeAnimation")
	}

	func chageColor(_ color: UIColor) {
		UIView.animate(withDuration: 0.15) {
			self.backgroundColor = color
		}
	}
}
