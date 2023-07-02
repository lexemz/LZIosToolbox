//
//  ViewControllersManifest.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 15.06.2023.
//

import UIKit

let itemsManifest: [TableViewItemProtocol] = [
	TableViewItem(title: "Scroll View", viewController: FormViewController()),

	// MARK: Chapter 2
	TableViewItemsGroup(
		title: "Chapter 2",
		items: [
			TableViewItem(title: "ViewController", viewController: ViewController()),
			TableViewItem(title: "MyViewController", viewController: MyViewController())
		]
	),

	// MARK: Chapter 3
	TableViewItemsGroup(
		title: "Chapter 3",
		items: [
			TableViewItem(title: "Ex 5", viewController: ViewController_C3_1.instantiate(name: "Chapter 3")),
		]
	),

	// MARK: Chapter 4
	TableViewItemsGroup(
		title: "Chapter 4",
		items: [
			TableViewItem(title: "Chapter 4 Challange 1", viewController: ViewController_C4_1.instantiate(name: "Chapter 4")),
			TableViewItem(title: "Chapter 4 Challange 2", viewController: ViewController_C4_2.instantiate(name: "Chapter 4")),
			TableViewItem(title: "Chapter 4 Challange 3", viewController: ViewController_C4_3.instantiate(name: "Chapter 4")),
			TableViewItem(title: "Chapter 4 Challange 4", viewController: ViewController_C4_4.instantiate(name: "Chapter 4")),
		]
	)
]
