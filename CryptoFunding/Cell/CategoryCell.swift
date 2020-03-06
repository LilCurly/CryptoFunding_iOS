//
//  CategoryCell.swift
//  CryptoFunding
//
//  Created by Emil on 28/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {

    static let reuseCellIdentifier = "CategoryCell"
    
    @IBOutlet weak var imageBackgroundView: UIView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override var isSelected: Bool {
        
        didSet {
            if isSelected {
                imageBackgroundView.backgroundColor = UIColor.appPurple
                categoryImageView.tintColor = UIColor.appWhite
            } else {
                imageBackgroundView.backgroundColor = UIColor.appWhite
                categoryImageView.tintColor = UIColor.appPurple
            }
        }
        
    }
    
    override var isHighlighted: Bool {
        
        didSet {
            if isHighlighted {
                imageBackgroundView.backgroundColor = UIColor.appPurple
                categoryImageView.tintColor = UIColor.appWhite
            } else {
                imageBackgroundView.backgroundColor = UIColor.appWhite
                categoryImageView.tintColor = UIColor.appPurple
            }
        }
        
    }
    
    var category: Category? {
        
        didSet {
            guard let aCategory = category else { return }
            
            categoryLabel.text = aCategory.name
            categoryImageView.image = UIImage(named: aCategory.imageName)
        }
        
    }
    
    override func awakeFromNib() {
        backgroundColor = .clear
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = UIColor.appWhite
        categoryLabel.adjustsFontSizeToFitWidth = true
        categoryLabel.numberOfLines = 2
        imageBackgroundView.backgroundColor = UIColor.appWhite
        categoryImageView.tintColor = UIColor.appPurple
        imageBackgroundView.layer.cornerRadius = 10
    }

}
