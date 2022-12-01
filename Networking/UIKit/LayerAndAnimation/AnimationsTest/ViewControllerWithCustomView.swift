//
//  ViewControllerWithCustomView.swift
//  AnimationsTest
//
//  Created by Igor Buzykin on 25.09.2022.
//

import UIKit

class LXView: UIView {
  override func action(for layer: CALayer, forKey event: String) -> CAAction? {
    // Event - возвращает строкой имя того совйства вью (слоя), которое мы изменили
    print("event: \(event)")
    return nil
  }
}

class ViewControllerWithCustomView: UIViewController {
  private var customView: LXView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    recreateView()
  }
  
  @IBAction func recreateViewTap(_ sender: UIBarButtonItem) {
    recreateView()
  }
  
  @IBAction func changeUIViewLayerTap(_ sender: UIButton) {
    customView.layer.cornerRadius = customView.frame.width / 2
  }
  
  private func recreateView() {
    if let customView = customView {
      customView.removeFromSuperview()
      self.customView = nil
    }
        
    customView = LXView()
    customView.frame.size = .init(width: 100, height: 100)
    customView.frame.origin = CGPoint(
      x: view.frame.width / 2 - customView.frame.width / 2,
      y: view.frame.height / 2 - customView.frame.height / 2
    )
    customView.backgroundColor = UIColor.black
    view.addSubview(customView)
  }
}
