//
//  ViewController.swift
//  FloatingView
//
//  Created by Igor Buzykin on 17.10.2022.
//

import UIKit

class ViewController: UIViewController {
  private let floatView = {
    let view = UIView()
    view.backgroundColor = .systemCyan
    view.layer.cornerRadius = 10
    view.frame.size = CGSize(width: 100, height: 100)
    return view
  }()

  private let socketManager = SocketIOManager()

  override func viewDidLoad() {
    super.viewDidLoad()

    socketManager.delegate = self
    socketManager.connect()
    view.addSubview(floatView)
    floatView.center = view.center
    setupRecognizer()
  }

  private func setupRecognizer() {
    let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
    floatView.addGestureRecognizer(gestureRecognizer)
  }

  @objc
  private func didPan(_ recognizer: UIPanGestureRecognizer) {
    switch recognizer.state {
    case .changed:
      let translation = recognizer.translation(in: view)

      let newX = floatView.center.x + translation.x
      let newY = floatView.center.y + translation.y

      print(newX, newY)

      socketManager.send(position: [
        "x": Double(newX),
        "y": Double(newY),
        "client": 1
      ])

      floatView.center = CGPoint(x: newX, y: newY)
      recognizer.setTranslation(.zero, in: view)
    default: break
    }
  }
}

extension ViewController: SocketIOManagerDelegate {
  func socketManager(_ socketManager: SocketIOManager, didReceive position: [String: Any]) {
    guard
      let x = position["x"] as? CGFloat,
      let y = position["y"] as? CGFloat
    else { return }
    floatView.center = CGPoint(x: x, y: y)
  }
}
