//
//  ViewController.swift
//  ReferensesTypes
//
//  Created by Igor Buzykin on 06.04.2023.
//

import UIKit

class ViewController: UIViewController {

	let asyncWorker = AsyncWorker()

	var value = 0 {
		didSet { print(value) }
	}

	deinit {
		print("Контроллер выгружен")
	}

	@IBAction func strongRefTap(_ sender: Any) {
		asyncWorker.execute {
			self.value += 1
		}
		dismiss(animated: true)
	}

	@IBAction func weakRefTap(_ sender: Any) {
		asyncWorker.execute { [weak self] in
			self?.value += 1
		}
		dismiss(animated: true)
	}

	@IBAction func unownedRefTap(_ sender: Any) {
		asyncWorker.execute { [unowned self] in
			self.value += 1
		}
		dismiss(animated: true)
	}

	@IBAction func weakWeakTap(_ sender: Any) {
		asyncWorker.execute() { [weak self] in

			// Из-за того, что захват слабый и нет повышения, утечки не будет
			self?.asyncWorker.execute {
				self?.value += 1
			}
		}
        asyncWorker.execute(time: 6) {
            self.dismiss(animated: true)
        }
	}

	@IBAction func strongWeakTap(_ sender: Any) {
		asyncWorker.execute(tag: "#1") {
            self.value += 1
            
			self.asyncWorker.execute(tag: "#2") { [weak self] in
				self?.value += 1
			}
		}
		dismiss(animated: true)
	}
    
    @IBAction func weakWithUpgrade(_ sender: Any) {
        asyncWorker.execute(tag: "#1") { [weak self] in
            guard let self else { return }
            
            // Не будет выполнено, так как на момент выполнения кложуры guard будет провален

            self.value += 1
            
            // Потенциально может образовать утечку
            // если класс будет существовать на момент вызова
            asyncWorker.execute(tag: "#2") {
                self.value += 1
            }
        }
        asyncWorker.execute(time: 6) {
            self.dismiss(animated: true)
        }
    }
}

