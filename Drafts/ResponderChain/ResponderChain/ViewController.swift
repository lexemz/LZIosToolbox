//
//  ViewController.swift
//  ResponderChain
//
//  Created by Igor Buzykin on 03.06.2023.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var button: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		button.addTarget(nil, action: #selector(ListAction.didSelectItem), for: .touchUpInside)
	}

}

