//
//  SelectionViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 15.06.2023.
//

import UIKit

final class SelectionViewController: UITableViewController {

	let items: [TableViewItemProtocol] 

	init(items: [TableViewItemProtocol]) {
		self.items = items
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		items.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let item = items[indexPath.row]

		var content = cell.defaultContentConfiguration()

		content.text = item.title
		if item is TableViewItemsGroup {
			cell.accessoryType = .disclosureIndicator
		}
		
		cell.contentConfiguration = content
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let item = items[indexPath.row]

		if let item = item as? TableViewItemsGroup {
			let selectionVC = SelectionViewController(items: item.items)
			selectionVC.title = item.title
			navigationController?.pushViewController(selectionVC, animated: false)
		}

		if let item = item as? TableViewItem {
			navigationController?.pushViewController(item.viewController, animated: false)
		}
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

