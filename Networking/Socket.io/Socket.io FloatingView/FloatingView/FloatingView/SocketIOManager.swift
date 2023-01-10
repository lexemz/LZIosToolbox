//
//  SocketIOManager.swift
//  FloatingView
//
//  Created by Igor Buzykin on 17.10.2022.
//

import Foundation
import SocketIO

protocol SocketIOManagerDelegate: AnyObject {
  func socketManager(_ socketManager: SocketIOManager, didReceive position: [String: Any])
  func socketManager(_ socketManager: SocketIOManager, didReceive position: Position)
}

final class SocketIOManager {
  weak var delegate: SocketIOManagerDelegate?
  
  private let manager: SocketManager
  private let socket: SocketIOClient
  
  init() {
    self.manager = SocketManager(
      socketURL: URL(string: "ws://192.168.1.2:3000")!,
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
  
  func send(position: [String: Any]) {
    socket.emit("position", position)
  }
  
  func send(position: Position) {
    socket.emit("position", position)
  }
  
  private func setupSocketEvents() {
    socket.on("position") { [weak self] data, _ in
      guard let self = self else { return }
      guard let data = data.first as? [String: Any] else { return }
      print("REVEIVED DATA: \(data)")
//      self.delegate?.socketManager(self, didReceive: data)
    }
    
    socket.on("position") { [weak self] data, _ in
      guard let self = self else { return }
      
      guard
        let firstData = data.first,
        let data = try? JSONSerialization.data(withJSONObject: firstData),
        let position = try? JSONDecoder().decode(Position.self, from: data)
      else { return }
      print("REVEIVED DATA: \(data)")
      self.delegate?.socketManager(self, didReceive: position)
    }
  }
}
