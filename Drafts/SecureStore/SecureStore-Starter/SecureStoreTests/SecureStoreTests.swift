/// Copyright (c) 2023 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import XCTest
@testable import SecureStore

final class SecureStoreTests: XCTestCase {

	var secureStoreWithGenericPwd: SecureStore!
	var secureStoreWithInternetPwd: SecureStore!

	private let defaultAccount = "testableAccount"
	private let defaultPassword = "testablePassword"

	override func setUp() {
		super.setUp()
		let genericPassQueries = GenericPasswordQueryable(service: "testable-service")
		let internetPassQueries = InternetPasswordQueryable(server: "testable-server",
																												port: 8080,
																												path: "testable-path",
																												securityDomain: "testable-dobain",
																												internetProtocol: .https,
																												internetAuthenticationType: .httpBasic)

		secureStoreWithGenericPwd = .init(secureStoreQueryable: genericPassQueries)
		secureStoreWithInternetPwd = .init(secureStoreQueryable: internetPassQueries)
	}

	override func tearDown() {
		try? secureStoreWithGenericPwd.removeAllValues()
		try? secureStoreWithInternetPwd.removeAllValues()
		super.tearDown()
	}
}

// MARK: - Generic passwords test cases

extension SecureStoreTests {
	func testSaveGenericPassword() {
		do {
			try secureStoreWithGenericPwd.setValue(defaultPassword, for: defaultAccount)
		} catch {
			XCTFail("Пароль не сохранен в keychain")
		}
	}

	func testReadGenericPassword() {
		do {
			try secureStoreWithGenericPwd.setValue(defaultPassword, for: defaultAccount)
			let password = try secureStoreWithGenericPwd.getValue(for: defaultAccount)
			XCTAssertEqual(password, defaultPassword)
		} catch {
			XCTFail()
		}
	}

	func testRemoveGenericPassword() {
		let anotherAccount = defaultAccount + "1"
		let anotherPassword = defaultPassword + "1"

		do {
			try secureStoreWithGenericPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithGenericPwd.setValue(anotherPassword, for: anotherAccount)
			try secureStoreWithGenericPwd.removeValue(for: defaultAccount)

			let anotherPass = try secureStoreWithGenericPwd.getValue(for: anotherAccount)
			let pass = try secureStoreWithGenericPwd.getValue(for: defaultAccount)

			XCTAssertNil(pass)
			XCTAssertEqual(anotherPass, anotherPassword)
		} catch {
			XCTFail()
		}
	}

	func testRemoveAllGenericPassword() {
		let anotherAccount = defaultAccount + "1"
		let anotherPassword = defaultPassword + "1"

		do {
			try secureStoreWithGenericPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithGenericPwd.setValue(anotherPassword, for: anotherAccount)
			try secureStoreWithGenericPwd.removeAllValues()

			let anotherPass = try secureStoreWithGenericPwd.getValue(for: anotherAccount)
			let pass = try secureStoreWithGenericPwd.getValue(for: defaultAccount)

			XCTAssertNil(pass)
			XCTAssertNil(anotherPass)
		} catch {
			XCTFail()
		}
	}

	func testUpdateGenericPassword() {
		let anotherPassword = defaultPassword + "123"

		do {
			try secureStoreWithGenericPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithGenericPwd.setValue(anotherPassword, for: defaultAccount)
			let password = try secureStoreWithGenericPwd.getValue(for: defaultAccount)
			XCTAssertEqual(password, anotherPassword)
			XCTAssertNotEqual(password, defaultPassword)
		} catch {
			XCTFail()
		}
	}
}

// MARK: - Internet passwords test cases

extension SecureStoreTests {
	func testSaveInternetPassword() {
		do {
			try secureStoreWithInternetPwd.setValue(defaultPassword, for: defaultAccount)
		} catch {
			XCTFail("Пароль не сохранен в keychain")
		}
	}

	func testReadInternetPassword() {
		do {
			try secureStoreWithInternetPwd.setValue(defaultPassword, for: defaultAccount)
			let password = try secureStoreWithInternetPwd.getValue(for: defaultAccount)
			XCTAssertEqual(password, defaultPassword)
		} catch {
			XCTFail()
		}
	}

	func testRemoveInternetPassword() {
		let anotherAccount = defaultAccount + "1"
		let anotherPassword = defaultPassword + "1"

		do {
			try secureStoreWithInternetPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithInternetPwd.setValue(anotherPassword, for: anotherAccount)
			try secureStoreWithInternetPwd.removeValue(for: defaultAccount)

			let anotherPass = try secureStoreWithInternetPwd.getValue(for: anotherAccount)
			let pass = try secureStoreWithInternetPwd.getValue(for: defaultAccount)

			XCTAssertNil(pass)
			XCTAssertEqual(anotherPass, anotherPassword)
		} catch {
			XCTFail()
		}
	}

	func testRemoveAllInternetPassword() {
		let anotherAccount = defaultAccount + "1"
		let anotherPassword = defaultPassword + "1"

		do {
			try secureStoreWithInternetPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithInternetPwd.setValue(anotherPassword, for: anotherAccount)
			try secureStoreWithInternetPwd.removeAllValues()

			let anotherPass = try secureStoreWithInternetPwd.getValue(for: anotherAccount)
			let pass = try secureStoreWithInternetPwd.getValue(for: defaultAccount)

			XCTAssertNil(pass)
			XCTAssertNil(anotherPass)
		} catch {
			XCTFail()
		}
	}

	func testUpdateInternetPassword() {
		let anotherPassword = defaultPassword + "123"

		do {
			try secureStoreWithInternetPwd.setValue(defaultPassword, for: defaultAccount)
			try secureStoreWithInternetPwd.setValue(anotherPassword, for: defaultAccount)
			let password = try secureStoreWithInternetPwd.getValue(for: defaultAccount)
			XCTAssertEqual(password, anotherPassword)
			XCTAssertNotEqual(password, defaultPassword)
		} catch {
			XCTFail()
		}
	}
}
