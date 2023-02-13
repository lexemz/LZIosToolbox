//
//  BuyViewController.swift
//  Coordinator
//
//  Created by Igor Buzykin on 04.02.2023.
//

import UIKit

final class BuyViewController: UIViewController, Storyboarded {

	@IBOutlet var buyLabel: UILabel!

	weak var coordinator: BuyCoordinatorProtocol?

	@IBAction func nextButtonTap(_ sender: Any) {
		coordinator?.openBuy2()
	}
}
