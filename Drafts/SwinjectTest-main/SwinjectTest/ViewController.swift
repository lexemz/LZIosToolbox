//
//  ViewController.swift
//  SwinjectTest
//
//  Created by Igor Buzykin on 02.08.2022.
//

import UIKit
import Swinject

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func goButtonPressed(_ sender: Any) {
        let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        guard let secondVC = viewController as? SecondViewController else { return }
        
        let container = Container()
        container.register(ColorRandomizer.self) { _ in
            ColorRandomizer()
        }
        
        secondVC.container = container
        
        present(secondVC, animated: true)
    }
}

