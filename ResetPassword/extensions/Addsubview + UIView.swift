//
//  Addsubview + UIView.swift
//  ResetPassword
//
//  Created by imac on 03.04.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ addSubview($0) })
    }
}

