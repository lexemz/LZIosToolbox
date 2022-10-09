//
//  SocketClient.swift
//  Socket.io
//
//  Created by Igor Buzykin on 09.10.2022.
//

import Foundation
import SocketIO

class SocketClient {
  let manager: SocketManager
  let socket: SocketIOClient

  init(url: URL) {
    self.manager = SocketManager(socketURL: url)
    self.socket = manager.defaultSocket
  }

  func connect() {
    socket.connect()
  }

  func disconnect() {
    socket.disconnect()
  }

  func send() {
//    socket.emit(<#T##event: String##String#>, <#T##items: SocketData...##SocketData#>)
  }
}
