//
//  ImageDownloader.swift
//  AwJeez!
//
//  Created by Farbod on 4/29/20.
//  Copyright © 2020 Farbod. All rights reserved.
//

import Foundation
import Kingfisher
import UIKit
extension UIImageView {
    func downloadImage(url:String) {
        if let url = URL(string:url) {
            kf.indicatorType = .activity
            kf.setImage(with: url ,placeholder: UIImage(named: "bg"))
        }
    }
}
