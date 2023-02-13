//
//  ViewControllerWithUIView.swift
//  AnimationsTest
//
//  Created by Igor Buzykin on 19.09.2022.
//

import UIKit

class ViewControllerWithUIView: UIViewController {
  private var customView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    recreateView()
  }
    
  @IBAction func recreateViewTap(_ sender: UIBarButtonItem) {
    recreateView()
  }
    
  // Не смотря на то, что мы разрешаем анимацию - она не произойдет
  @IBAction func transactionTap(_ sender: UIButton) {
    CATransaction.begin()
    CATransaction.setAnimationDuration(1)
    CATransaction.setDisableActions(false) // Разрешение анимации
    customView.layer.cornerRadius = customView.layer.frame.width / 2
    CATransaction.commit()
  }
    
  // Эксперемент 2 - из статьи
  // Есть анимация
  @IBAction func nonDelegate(_ sender: UIButton) {
    customView.layer.delegate = nil
    customView.layer.cornerRadius = customView.layer.frame.width / 2
  }
    
  private func recreateView() {
    if let customView = customView {
      customView.removeFromSuperview()
      self.customView = nil
    }
        
    customView = UIView()
    customView.frame.size = .init(width: 100, height: 100)
    customView.frame.origin = CGPoint(
      x: view.frame.width / 2 - customView.frame.width / 2,
      y: view.frame.height / 2 - customView.frame.height / 2
    )
    customView.backgroundColor = UIColor.black
    view.addSubview(customView)
  }
}
