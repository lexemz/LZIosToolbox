//
//  SelectionConfig.swift
//  Modern-Auto-Layout
//
//  Created by Бузыкин Игорь Валерьевич on 26.06.2023.
//

import UIKit

protocol TableViewItemProtocol {
	var title: String { get }
}

struct TableViewItem: TableViewItemProtocol {
	let title: String
	let viewController: UIViewController
}

struct TableViewItemsGroup: TableViewItemProtocol {
	let title: String
	let items: [TableViewItemProtocol]
}
