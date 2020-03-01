//
//  BottomLeftRoundedView.swift
//  CryptoFunding
//
//  Created by Emil on 21/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class BottomLeftRoundedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.appLightGray
        layer.cornerRadius = 60
        layer.maskedCorners = [.layerMinXMaxYCorner]
        clipsToBounds = true
    }

}
