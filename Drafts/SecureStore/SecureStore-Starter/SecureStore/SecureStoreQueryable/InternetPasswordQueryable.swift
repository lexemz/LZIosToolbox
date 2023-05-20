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

/// Структура для работы с интернет паролями
///
/// Нужна для работы с интернет паролями внутри приложения
public struct InternetPasswordQueryable {
	let server: String
	let port: Int
	let path: String
	let securityDomain: String
	let internetProtocol: InternetProtocol
	let internetAuthenticationType: InternetAuthenticationType
}

extension InternetPasswordQueryable: SecureStoreQueryable {
	public var query: [String: Any] {
		var query: [String: Any] = [:]
		// Обозначение, что работа идет с интернет паролями
		query[kSecClass as String] = kSecClassInternetPassword
		// Порт веб-ресурса
		query[kSecAttrPort as String] = port
		// Сервер веб-ресурса
		query[kSecAttrServer as String] = server
		// Домен безопасности веб-ресурса
		query[kSecAttrSecurityDomain as String] = securityDomain
		// Путь веб-ресурса
		query[kSecAttrPath as String] = path
		// Интернет протокол веб-ресурса
		query[kSecAttrProtocol as String] = internetProtocol.rawValue
		// Тип авторизации веб-ресурса
		query[kSecAttrAuthenticationType as String] = internetAuthenticationType.rawValue
		return query
	}
}
