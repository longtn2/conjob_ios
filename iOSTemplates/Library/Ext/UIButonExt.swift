//
//  UIButonExt.swift
//  iOSTemplates
//
//  Created by mac on 12/4/24.
//  Copyright © 2024 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    func pulse() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.15
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        layer.add(pulse, forKey: "pulse")
    }
}
