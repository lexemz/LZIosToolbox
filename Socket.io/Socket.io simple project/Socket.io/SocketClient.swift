//
//  SocketClient.swift
//  Socket.io
//
//  Created by Igor Buzykin on 09.10.2022.
//

import Foundation
import SocketIO

protocol SocketClientDelegate: AnyObject {
  func counterMessage()
}

class SocketClient {
  weak var delegate: SocketClientDelegate?

  private let manager: SocketManager
  private let socket: SocketIOClient
  
  init() {
    self.manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!, config: [.log(true), .compress])
    self.socket = manager.defaultSocket
    setupSocketEvents()
  }

  func connect() {
    socket.connect()
  }

  func disconnect() {
    socket.disconnect()
  }

  func send() {
    socket.emit("counter")
  }
  
  private func setupSocketEvents() {
    socket.on("counter") { [weak self] data, ack in
      guard let self else { return }
      self.delegate?.counterMessage()
    }
    
    socket.on(clientEvent: .connect) { data, ack in
      print("Socket did connect: \(data)")
    }
  }
}
