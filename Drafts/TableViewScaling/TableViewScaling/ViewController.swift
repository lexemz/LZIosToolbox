//
//  ViewController.swift
//  TableViewScaling
//
//  Created by Бузыкин Игорь Валерьевич on 23.01.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	let strings = [
		Lorem.word,
		Lorem.sentence,
		Lorem.paragraph
	]

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.register(
			UINib(nibName: "TableViewCell", bundle: nil),
			forCellReuseIdentifier: TableViewCell.id
		)
	}
}

extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		strings.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
		cell.configure(string: strings[indexPath.row])
		return cell
	}
}

