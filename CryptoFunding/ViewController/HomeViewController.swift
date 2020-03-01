//
//  HomeViewController.swift
//  CryptoFunding
//
//  Created by Emil on 21/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoriesLabel: LeftLabel!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var trendingLabel: LeftLabel!
    
    private let categories = Category.categories
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = UIColor.appDarkGray
        tabBarController?.tabBar.barTintColor = UIColor.appLightGray
        tabBarController?.tabBar.tintColor = UIColor.appWhite
        navigationItem.title = "Crypto Bingo"
        navigationItem.titleView?.tintColor = UIColor.appWhite
        
        categoriesLabel.text = "Categories"
        trendingLabel.text = "Trending"
        
        setupCategoryCollectionView()
        setupNavigationBar()
    }
    
    func setupCategoryCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        categoriesCollectionView.collectionViewLayout = layout
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.backgroundColor = .clear
        categoriesCollectionView.showsHorizontalScrollIndicator = false
        categoriesCollectionView.contentInset.left = 16
        categoriesCollectionView.contentInset.right = 16
        categoriesCollectionView.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: CategoryCell.reuseCellIdentifier)
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseCellIdentifier, for: indexPath) as! CategoryCell
                
        cell.category = categories[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableHeight = collectionView.bounds.inset(by: collectionView.layoutMargins).height
        
        return CGSize(width: availableHeight - 40, height: availableHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
}
