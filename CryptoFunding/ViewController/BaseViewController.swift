//
//  BaseViewController.swift
//  CryptoFunding
//
//  Created by Emil Noirhomme on 25/05/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = UIColor.appDarkGray
        tabBarController?.tabBar.barTintColor = UIColor.appLightGray
        tabBarController?.tabBar.tintColor = UIColor.appWhite
        navigationItem.titleView?.tintColor = UIColor.appWhite
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.view.backgroundColor = .clear
    }
    
    func addWalletsButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Wallets", style: .plain, target: self, action: #selector(openWallets))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.appWhite
    }
    
    @objc func openWallets() {
        print("add code to open new ViewController")
    }
}
