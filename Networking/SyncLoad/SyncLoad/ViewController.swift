//
//  ViewController.swift
//  SyncLoad
//
//  Created by Igor Buzykin on 01.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let loader = Loader()

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.load { results, errors in
            print("results: \(results.count)")
            print("errors: \(errors.count)")
            
            dump(results)
        }
    }
}

