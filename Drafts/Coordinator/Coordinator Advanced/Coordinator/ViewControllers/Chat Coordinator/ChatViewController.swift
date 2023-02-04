//
//  ChatViewController.swift
//  Coordinator
//
//  Created by Igor Buzykin on 12.02.2023.
//

import UIKit

class ChatViewController: UIViewController, Storyboarded {

	weak var coordinator: ChatCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	@IBAction func cancelButtonTap(_ sender: Any) {
		coordinator?.endChat()
	}
}
