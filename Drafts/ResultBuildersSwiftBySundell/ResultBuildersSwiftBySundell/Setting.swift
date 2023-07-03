//
//  Setting.swift
//  ResultBuildersSwiftBySundell
//
//  Created by Igor Buzykin on 03.07.2023.
//

import Foundation

protocol SettingsConvertable {
	var asSettings: [Setting] { get }
}

struct Setting: SettingsConvertable {
	var name: String
	var value: Value

	var asSettings: [Setting] {
		[self]
	}
}

extension Setting {
	enum Value {
		case bool(Bool)
		case int(Int)
		case string(String)
		case group([Setting])
	}
}

struct SettingGroup: SettingsConvertable {
	var name: String
	var settings: [Setting]

	var asSettings: [Setting] {
		[Setting(name: name, value: .group(settings))]
	}

	init(
		name: String,
		@SettingsBuilder builder: () -> [Setting]
	) {
		self.name = name
		self.settings = builder()
	}
}

@resultBuilder
struct SettingsBuilder {
	static func buildBlock() -> [SettingsConvertable] { [] }

	static func buildBlock(_ settings: SettingsConvertable...) -> [Setting] {
		settings.flatMap { $0.asSettings }
	}
}

func makeSettings(@SettingsBuilder _ content: () -> [Setting]) -> [Setting] {
	content()
}
