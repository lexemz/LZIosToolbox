//
//  SocketIOManager.swift
//  FloatingView
//
//  Created by Igor Buzykin on 17.10.2022.
//

import Foundation
import SocketIO

protocol SocketIOManagerDelegate: AnyObject {
  func socketManager(_ socketManager: SocketIOManager, didReceive position: Position)
}

final class SocketIOManager {
  weak var delegate: SocketIOManagerDelegate?
  
  private let manager: SocketManager
  private let socket: SocketIOClient
  
  init() {
    self.manager = SocketManager(
      socketURL: URL(string: "ws://localhost:3000")!,
      config: [.log(true), .compress]
    )
    self.socket = manager.defaultSocket
    setupSocketEvents()
  }
  
  func connect() {
    socket.connect()
  }

  func disconnect() {
    socket.disconnect()
  }

  func send(position: Position) {
    socket.emit("position", position)
  }
  
  private func setupSocketEvents() {
    socket.on("position") { [weak self] data, ack in
      guard let self = self else { return }
      guard let position = data.socketRepresentation() as? Position else {
        print("casting failed")
        return
      }
      self.delegate?.socketManager(self, didReceive: position)
    }
  }
}
