//
//  ViewController.swift
//  FrameVsBounds
//
//  Created by Igor Buzykin on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var containerView: UIView!
  @IBOutlet var imageView: UIImageView!
  
  @IBOutlet var frameXLabel: UILabel!
  @IBOutlet var frameYLabel: UILabel!
  @IBOutlet var frameWidthLabel: UILabel!
  @IBOutlet var frameHeightLabel: UILabel!
  @IBOutlet var boundsXLabel: UILabel!
  @IBOutlet var boundsYLabel: UILabel!
  @IBOutlet var boundsWidthLabel: UILabel!
  @IBOutlet var boundsHeightLabel: UILabel!
  @IBOutlet var centerXLabel: UILabel!
  @IBOutlet var centerYLabel: UILabel!
  @IBOutlet var rotationLabel: UILabel!
  
  @IBOutlet var frameXSlider: UISlider!
  @IBOutlet var frameYSlider: UISlider!
  @IBOutlet var frameWidthSlider: UISlider!
  @IBOutlet var frameHeightSlider: UISlider!
  @IBOutlet var boundsXSlider: UISlider!
  @IBOutlet var boundsYSlider: UISlider!
  @IBOutlet var boundsWidthSlider: UISlider!
  @IBOutlet var boundsHeightSlider: UISlider!
  @IBOutlet var centerXSlider: UISlider!
  @IBOutlet var centerYSlider: UISlider!
  @IBOutlet var rotationSlider: UISlider!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  @IBAction func frameXSliderMoved() {
    containerView.frame.origin.x = CGFloat(frameXSlider.value)
    updateLabels()
  }
  
  @IBAction func frameYSliderMoved() {
    containerView.frame.origin.y = CGFloat(frameYSlider.value)
    updateLabels()
  }
  
  @IBAction func frameWidthSliderMoved() {
    containerView.frame.size.width = CGFloat(frameWidthSlider.value)
    updateLabels()
  }
  
  @IBAction func frameHeightSliderMoved() {
    containerView.frame.size.height = CGFloat(frameHeightSlider.value)
    updateLabels()
  }
  
  @IBAction func boundsXSliderMoved() {
    containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
    updateLabels()
  }
  
  @IBAction func boundsYSliderMoved() {
    containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
    updateLabels()
  }
  
  @IBAction func boundsWidthSliderMoved() {
    containerView.bounds.size.width = CGFloat(boundsWidthSlider.value)
    updateLabels()
  }
  
  @IBAction func boundsHeightSliderMoved() {
    containerView.bounds.size.height = CGFloat(boundsHeightSlider.value)
    updateLabels()
  }
  
  @IBAction func centerXSliderMoved() {}
  
  @IBAction func centerYSliderMoved() {}
  
  @IBAction func rotationSliderMoved() {}
  
  @IBAction func touchUpOnSlider() {
    logInfo()
  }
  
  private func setupUI() {
    containerView.frame.size = CGSize(
      width: view.frame.width / 2,
      height: view.frame.width / 2
    )
    containerView.center = CGPoint(
      x: view.center.x,
      y: view.safeAreaInsets.top + containerView.frame.height / 2 + 60
    )
    imageView.frame.size = CGSize(
      width: containerView.frame.width * 2,
      height: containerView.frame.height * 2
    )
    imageView.center = CGPoint(
      x: containerView.frame.size.width / 2,
      y: containerView.frame.size.height / 2
    )

    
    frameXSlider.minimumValue = 0
    frameXSlider.maximumValue = Float(containerView.frame.origin.x * 2)
    frameXSlider.value = Float(containerView.frame.origin.x)
    
    frameYSlider.minimumValue = 0
    frameYSlider.maximumValue = Float(containerView.frame.origin.x * 2)
    frameYSlider.value = Float(containerView.frame.origin.x)
    
    frameWidthSlider.minimumValue = 0
    frameWidthSlider.maximumValue = Float(containerView.frame.size.width * 2)
    frameWidthSlider.value = Float(containerView.frame.size.width)
    
    frameHeightSlider.minimumValue = 0
    frameHeightSlider.maximumValue = Float(containerView.frame.size.height * 2)
    frameHeightSlider.value = Float(containerView.frame.size.height)
    
    boundsXSlider.minimumValue = Float(-containerView.frame.size.width)
    boundsXSlider.maximumValue = Float(containerView.frame.size.width)
    boundsXSlider.value = 0
    
    boundsYSlider.minimumValue = Float(-containerView.frame.size.height)
    boundsYSlider.maximumValue = Float(containerView.frame.size.height)
    boundsYSlider.value = 0

    boundsWidthSlider.minimumValue = 0
    boundsWidthSlider.maximumValue = Float(containerView.bounds.size.width * 2)
    boundsWidthSlider.value = Float(containerView.bounds.size.width)

    boundsHeightSlider.minimumValue = 0
    boundsHeightSlider.maximumValue = Float(containerView.bounds.size.height * 2)
    boundsHeightSlider.value = Float(containerView.bounds.size.height)
    
    updateLabels()
  }
  
  private func updateLabels() {
    frameXLabel.text = String(format: "frame x = %.2f", containerView.frame.origin.x)
    frameYLabel.text = String(format: "frame y = %.2f", containerView.frame.origin.y)
    frameWidthLabel.text = String(format: "frame width = %.2f", containerView.frame.size.width)
    frameHeightLabel.text = String(format: "frame height = %.2f", containerView.frame.size.height)
    boundsXLabel.text = String(format: "bounds x = %.2f", containerView.bounds.origin.x)
    boundsYLabel.text = String(format: "bounds y = %.2f", containerView.bounds.origin.y)
    boundsWidthLabel.text = String(format: "bounds width = %.2f", containerView.bounds.size.width)
    boundsHeightLabel.text = String(format: "bounds height = %.2f", containerView.bounds.size.height)
    centerXLabel.text = String(format: "center x = %.2f", containerView.center.x)
    centerYLabel.text = String(format: "center y = %.2f", containerView.center.y)
//    rotationLabel.text = "rotation = \(imageview.)"
  }
  
  private func logInfo() {
    let info = """
    ==========[Frame]==========
    x: \(containerView.frame.origin.x)
    y: \(containerView.frame.origin.y)
    width: \(containerView.frame.size.width)
    height: \(containerView.frame.size.height)
    =========[Bounds]==========
    x: \(containerView.bounds.origin.x)
    y: \(containerView.bounds.origin.y)
    width: \(containerView.bounds.size.width)
    height: \(containerView.bounds.size.height)
    ===========================
    
    """
    
    print(info)
  }
}
