//
//  Position.swift
//  FloatingView
//
//  Created by Igor Buzykin on 17.10.2022.
//

import Foundation
import SocketIO

struct Position: SocketData {
  let x: CGFloat
  let y: CGFloat
  let client: String
}
