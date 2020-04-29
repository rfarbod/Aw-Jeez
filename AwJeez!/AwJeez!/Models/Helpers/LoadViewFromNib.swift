//
//  LoadViewFromNib.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle: Bundle? = nil) -> UIView? {
      return UINib(
          nibName: nibNamed,
          bundle: bundle
      ).instantiate(withOwner: nil, options: nil)[0] as? UIView
  }
}
