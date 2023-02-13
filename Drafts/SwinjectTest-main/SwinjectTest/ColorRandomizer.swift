//
//  ColorRandomizer.swift
//  SwinjectTest
//
//  Created by Igor Buzykin on 02.08.2022.
//

import UIKit

class ColorRandomizer {
    func random() -> UIColor {
        [UIColor.red, .green, .blue, .purple].randomElement()!
    }
}
