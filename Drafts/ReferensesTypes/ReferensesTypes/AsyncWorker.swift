//
//  AsyncWorker.swift
//  ReferensesTypes
//
//  Created by Igor Buzykin on 06.04.2023.
//

import Foundation

final class AsyncWorker {

	func execute(tag: String = "", _ task: @escaping () -> Void) {
		print("Async task \(tag): Задача запущена")
		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			task()
			print("Async task \(tag): Задача выполнена")
		}
	}
    
    func execute(time: Double, _ task: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            task()
        }
    }
}
