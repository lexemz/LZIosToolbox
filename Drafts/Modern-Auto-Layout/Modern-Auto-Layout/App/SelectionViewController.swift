//
//  SelectionViewController.swift
//  Modern-Auto-Layout
//
//  Created by Igor Buzykin on 15.06.2023.
//

import UIKit

final class SelectionViewController: UITableViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		manifestViewControllers.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		var content = cell.defaultContentConfiguration()
		let type = type(of: manifestViewControllers[indexPath.row])
		content.text = String(describing: type)
		cell.contentConfiguration = content
		cell.accessoryType = .disclosureIndicator
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let viewController = manifestViewControllers[indexPath.row]
		tableView.deselectRow(at: indexPath, animated: true)
		navigationController?.pushViewController(viewController, animated: true)
	}
}

