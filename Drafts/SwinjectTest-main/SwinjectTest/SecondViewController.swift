//
//  SecondViewController.swift
//  SwinjectTest
//
//  Created by Igor Buzykin on 02.08.2022.
//

import UIKit
import Swinject

class SecondViewController: UIViewController {
    
    weak var container: Container?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = container?.resolve(ColorRandomizer.self)?.random()
        print(container)
    }
}
