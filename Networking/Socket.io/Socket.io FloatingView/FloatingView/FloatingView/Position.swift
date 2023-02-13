//
//  Position.swift
//  FloatingView
//
//  Created by Igor Buzykin on 17.10.2022.
//

import Foundation
import SocketIO

struct Position: SocketData, Decodable {
  let x: Double
  let y: Double
  let client: String
  
  func socketRepresentation() -> SocketData {
    [
      "x": x,
      "y": y,
      "client": client
    ]
  }
}
