//
//  ViewControllersManifest.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 15.06.2023.
//

import UIKit

let itemsManifest: [TableViewItemProtocol] = [
	TableViewItem(title: "Scroll View", viewController: FormViewController()),

	TableViewItemsGroup(
		title: "Chapter 2",
		items: [
			TableViewItem(title: "ViewController", viewController: ViewController()),
			TableViewItem(title: "MyViewController", viewController: MyViewController())
		]
	),

	TableViewItemsGroup(
		title: "Chapter 3",
		items: [
			TableViewItem(title: "Ex 5", viewController: ViewController_C3_1.instantiate(name: "Chapter3")),
		]
	)
]
