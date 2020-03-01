//
//  LeftLabel.swift
//  CryptoFunding
//
//  Created by Emil on 23/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class LeftLabel: UILabel {
    
    let leftInset: CGFloat = 6
    let rightInset: CGFloat = 12

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset, height: 30)
    }
    
    func setup() {
        backgroundColor = UIColor.appPurple
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 12
        layer.masksToBounds = true
        textColor = .white
        font = UIFont.boldSystemFont(ofSize: 20.0)
    }

}
