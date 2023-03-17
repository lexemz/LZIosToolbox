//
//  ViewController.swift
//  EnumRawRepresantable
//
//  Created by Бузыкин Игорь Валерьевич on 17.03.2023.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let admin = Users.admin
		print(admin.rawValue.name)

		let user = User(name: "admin", id: UUID())
		print(Users(rawValue: user))

		let nilUser = User(name: "", id: UUID())
		print(Users(rawValue: nilUser))
	}

}
