//
//  ViewController.swift
//  BackStatable
//
//  Created by Igor Buzykin on 03.07.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var textField: UITextField!


	@BackStatable var stringValue: String = ""

	override func viewDidLoad() {
		super.viewDidLoad()

		stringValue
		_stringValue.previousValue
		_stringValue.isValueChanged
	}

	@IBAction func changeTap(_ sender: Any) {
		stringValue = textField.text ?? ""
	}

	@IBAction func logTap(_ sender: Any) {
		print(stringValue, _stringValue.previousValue, _stringValue.isValueChanged)
	}
}

