//
//  ViewController.swift
//  Socket.io
//
//  Created by Igor Buzykin on 09.10.2022.
//

import UIKit
import SocketIO

class ViewController: UIViewController {
  
  @IBOutlet var countLabel: UILabel!
  
  private let socket = SocketClient()

  override func viewDidLoad() {
    super.viewDidLoad()
    socket.delegate = self
    socket.connect()
  }

  @IBAction func countTap(_ sender: UIButton) {
    socket.send()
  }
}

extension ViewController: SocketClientDelegate {
  func counterMessage() {
    countLabel.text = String(Int(countLabel.text!)! + 1)
  }
}
