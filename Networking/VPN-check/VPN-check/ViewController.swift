//
//  ViewController.swift
//  VPN-check
//
//  Created by Igor Buzykin on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet var vpnLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    vpnLabel.text = isVPNConnected() ? "VPN" : "NO VPN"
  }

  @IBAction func checkTap(_ sender: UIButton) {
    vpnLabel.text = isVPNConnected() ? "VPN" : "NO VPN"
  }

  func isVPNConnected() -> Bool {
    guard let cfDict = CFNetworkCopySystemProxySettings() else { return false }
    let nsDict = cfDict.takeRetainedValue() as NSDictionary
    guard let keys = (nsDict["__SCOPED__"] as! NSDictionary).allKeys as? [String] else { return false }

    let protocolsIdentifiers: [String] = ["tap", "tun", "ppp", "ipsec", "utun"]
    
    for key in keys {
      for protocolsIdentifier in protocolsIdentifiers {
        if key.contains(protocolsIdentifier) {
          return true
        }
      }
    }
    return false
  }
}
