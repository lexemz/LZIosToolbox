//
//  ViewControllerWithLayer.swift
//  AnimationsTest
//
//  Created by Igor Buzykin on 19.09.2022.
//

import UIKit

class ViewControllerWithLayer: UIViewController {
  private var layer: CALayer!

  override func viewDidLoad() {
    super.viewDidLoad()
    recreateLayer()
  }

  @IBAction func recreateLayerTap(_ sender: UIBarButtonItem) {
    recreateLayer()
  }
    
  // Эксперемент 1 - из статьи
  @IBAction func layerTap(_ sender: UIButton) {
    // Animate - 0.25 sec by default
    layer.cornerRadius = layer.frame.width / 2
  }
    
  @IBAction func transactionTap(_ sender: UIButton) {
    CATransaction.begin()
    CATransaction.setAnimationDuration(1)
    CATransaction.setCompletionBlock {
      print("Complete")
    }
    layer.cornerRadius = layer.frame.width / 2
    CATransaction.commit()
    
    /*
     Эквивалент транзации в API - UIKit:
     
     UIView.animate(withDuration: 1) {
         self.layer.cornerRadius = self.layer.frame.width / 2
     } completion: { completed in
        print("completed: \(completed)")
     }
     */
  }
    
  private func recreateLayer() {
    if let layer = layer {
      layer.removeFromSuperlayer()
      self.layer = nil
    }
        
    layer = CALayer()
    layer.frame.size = .init(width: 100, height: 100)
    layer.frame.origin = CGPoint(
      x: view.frame.width / 2 - layer.frame.width / 2,
      y: view.frame.height / 2 - layer.frame.height / 2
    )
    layer.backgroundColor = UIColor.black.cgColor
    view.layer.addSublayer(layer)
  }
}
