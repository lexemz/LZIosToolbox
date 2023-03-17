//
//  Collection+Extensions.swift
//  Coordinator
//
//  Created by Бузыкин Игорь Валерьевич on 17.03.2023.
//

import Foundation

extension Collection {
	/// Returns the element at the specified index if it is within bounds, otherwise nil.
	subscript(safe index: Index) -> Element? {
		indices.contains(index) ? self[index] : nil
	}
}
