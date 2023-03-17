//
//  Users.swift
//  EnumRawRepresantable
//
//  Created by Бузыкин Игорь Валерьевич on 17.03.2023.
//

import Foundation

struct User {
	let name: String
	let id: UUID
}

enum Users {
	case admin
	case defaultUser
	case god
}

extension Users: RawRepresentable {
	typealias RawValue = User

	var rawValue: User {
		switch self {

		case .admin:
			return User(name: "admin", id: UUID())
		case .defaultUser:
			return User(name: "admin", id: UUID())
		case .god:
			return User(name: "god", id: UUID())
		}
	}

	init?(rawValue: User) {
		if rawValue.name == "admin" {
			self = .admin
			return
		}
		if rawValue.name == "admin" {
			self = .admin
			return
		}
		if rawValue.name == "admin" {
			self = .admin
			return
		}
		return nil
	}
}

enum Users2 {
	case admin
	case defaultUser
	case god

	var currentUser: User {
		switch self {

		case .admin:
			return User(name: "admin", id: UUID())
		case .defaultUser:
			return User(name: "admin", id: UUID())
		case .god:
			return User(name: "god", id: UUID())
		}
	}
}
