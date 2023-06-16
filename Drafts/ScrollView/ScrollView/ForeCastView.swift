//
//  ForeCastView.swift
//  ScrollView
//
//  Created by Бузыкин Игорь Валерьевич on 16.06.2023.
//

import UIKit

class ForeCastView: UIView {

	private lazy var title: UILabel = {
		let title = UILabel()
		title.textColor = .label
		title.translatesAutoresizingMaskIntoConstraints = false
		return title
	}()

	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()

	private lazy var summaryLabel: UILabel = {
		let summaryLabel = UILabel()
		summaryLabel.textColor = .label
		summaryLabel.translatesAutoresizingMaskIntoConstraints = false
		return summaryLabel
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureUI()
		configureLayout()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupView(
		title: String,
		image: UIImage,
		summaryLabel: String
	) {
		self.title.text = title
		self.imageView.image = image
		self.summaryLabel.text = summaryLabel
	}

	private func configureUI() {
		addSubview(title)
		addSubview(imageView)
		addSubview(summaryLabel)
	}

	private func configureLayout() {
		let constraints = [
			title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

			imageView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),

			summaryLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
			summaryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			summaryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			summaryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
		]
		NSLayoutConstraint.activate(constraints)
	}
}
