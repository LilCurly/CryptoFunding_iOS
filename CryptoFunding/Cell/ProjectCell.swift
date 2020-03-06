//
//  ProjectCell.swift
//  CryptoFunding
//
//  Created by Emil on 03/03/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class ProjectCell: UICollectionViewCell {
    
    static let reuseCellIdentifier = "ProjectCell"

    @IBOutlet weak var myContentView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var projectTitleLabel: UILabel!
    @IBOutlet weak var fundedLabel: UILabel!

    var project: ProjectThumbnail? {
        
        didSet {
            guard let project = project else { return }
            categoryLabel.text = project.category
            backgroundImageView.image = UIImage(named: project.imageName)
            projectTitleLabel.text = project.projectTitle
            fundedLabel.text = "\(project.fundedRatio)%"
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myContentView.layer.cornerRadius = 8
        myContentView.clipsToBounds = true
        
        categoryLabel.textColor = UIColor.appWhite
        projectTitleLabel.textColor = UIColor.appWhite
        fundedLabel.textColor = UIColor.appWhite
        
        backgroundImageView.contentMode = .scaleToFill
        
    }

}
