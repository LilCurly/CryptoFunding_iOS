//
//  HomeViewController.swift
//  CryptoFunding
//
//  Created by Emil on 21/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var topContainerView: BottomLeftRoundedView!
    @IBOutlet weak var categoryLabel: LeftLabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var trendingLabel: LeftLabel!
    @IBOutlet weak var projectsCollectionView: UICollectionView!
    
    
    private let categories = Category.categories
    private var projects = ProjectThumbnail.pathfinderProjects
    private var cellSpacing: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
        super.addWalletsButton()
        cellSpacing = view.frame.width * 3 / 100
        navigationItem.title = "Crypto Bingo"
        
        categoryLabel.text = "Categories"
        trendingLabel.text = "Trending"
        
        setupCategoryCollectionView()
        setupProjectCollectionView()
    }
    
    func setupCategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        categoryCollectionView.collectionViewLayout = layout
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.backgroundColor = .clear
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.contentInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        categoryCollectionView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        categoryCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.reuseCellIdentifier)
    }
    
    func setupProjectCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        projectsCollectionView.collectionViewLayout = layout
        
        projectsCollectionView.delegate = self
        projectsCollectionView.dataSource = self
        projectsCollectionView.backgroundColor = .clear
        projectsCollectionView.showsHorizontalScrollIndicator = false
        projectsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        projectsCollectionView.register(UINib(nibName: "ProjectCell", bundle: nil), forCellWithReuseIdentifier: ProjectCell.reuseCellIdentifier)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == categoryCollectionView {
            return categories.count
        } else {
            return projects.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseCellIdentifier, for: indexPath) as! CategoryCell
                    
            cell.category = categories[indexPath.row]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProjectCell.reuseCellIdentifier, for: indexPath) as! ProjectCell
                    
            cell.project = projects[indexPath.row]
            
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableHeight = collectionView.bounds.inset(by: collectionView.layoutMargins).height - 1
        
        if collectionView == categoryCollectionView {
            return CGSize(width: availableHeight - 28, height: availableHeight)
        } else {
            return CGSize(width: (availableHeight * 0.8), height: availableHeight)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
}
