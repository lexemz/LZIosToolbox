//
//  Storyboarded.swift
//  Modern-Auto-Layout
//
//  Created by Бузыкин Игорь Валерьевич on 26.06.2023.
//

import UIKit

protocol Storyboarded {
	static func instantiate(name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
	static func instantiate(name: String) -> Self {
		let className = NSStringFromClass(self).components(separatedBy: ".")[1]
		print(className)
		let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
		return storyboard.instantiateViewController(withIdentifier: className) as! Self
	}
}
