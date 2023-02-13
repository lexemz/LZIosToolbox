//
//  ViewController.swift
//  TransparentNavigationBar
//
//  Created by Igor Buzykin on 01.02.2023.
//

import UIKit

class ViewController: UIViewController {

	let strings = [
		"1",
		"2",
		"3",
		"4",
		"5",		"1",
		"2",
		"3",
		"4",
		"5",		"1",
		"2",
		"3",
		"4",
		"5",		"1",
		"2",
		"3",
		"4",
		"5",		"1",
		"2",
		"3",
		"4",
		"5",
		"6"
	]

	@IBOutlet var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
	}

}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		strings.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

		var content = cell.defaultContentConfiguration()
		content.text = strings[indexPath.row]
		cell.contentConfiguration = content

		return cell
	}
}

