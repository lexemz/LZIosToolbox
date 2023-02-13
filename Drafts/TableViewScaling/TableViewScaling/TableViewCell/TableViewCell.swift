//
//  TableViewCell.swift
//  TableViewScaling
//
//  Created by Бузыкин Игорь Валерьевич on 23.01.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

	static let id: String = UUID().uuidString

	@IBOutlet var label: UILabel!
	@IBOutlet var backgroundCustomView: UIView!

	override func awakeFromNib() {
		super.awakeFromNib()
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.adjustsFontForContentSizeCategory = true
	}

	func configure(string: String) {
		label.text = string
	}
}
