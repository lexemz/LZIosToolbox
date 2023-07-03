//
//  ViewController.swift
//  ResultBuildersSwiftBySundell
//
//  Created by Igor Buzykin on 03.07.2023.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let settings = makeSettings {
			Setting(name: "Offline mode", value: .bool(false))
			Setting(name: "Search page size", value: .int(25))
			Setting(name: "Experimental", value: .group([
				Setting(name: "Default name", value: .string("Untitled")),
				Setting(name: "Fluid animations", value: .bool(true))
			]))
		}

		makeSwiftUIView()
	}

	func makeSwiftUIView() {
		let stack = VStack {
			Text("Hello")
			Text("World")
			Button("I', a button") {}
		}

		print(type(of: stack))
	}
}

