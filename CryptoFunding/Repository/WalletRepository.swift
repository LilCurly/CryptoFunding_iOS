//
//  WalletRepository.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

class WalletRepository {
    static let instance = WalletRepository()
    private let dao: AbstractDao = FakeDao()
    private var currentWallet: Wallet?
    lazy private var loadedWallets = [Wallet]()
    
    private init () {
        
    }
    
    func addWallet(wallet: Wallet) {
        loadAllWallets()
        let isAlreadyInside = loadedWallets.contains { (wal) -> Bool in
            wal.address == wallet.address
        }
        if !isAlreadyInside {
            if dao.saveWallet(wallet: wallet) {
                loadedWallets.append(wallet)
            }
        }
    }
    
    fileprivate func loadAllWallets() {
        loadedWallets = dao.loadWallets()
    }
    
    func getAllWallets() -> [Wallet] {
        loadAllWallets()
        return loadedWallets
    }
    
    func setCurrent(wallet: Wallet) {
        currentWallet = loadedWallets.filter({ (wal) -> Bool in
            wal.address == wallet.address
            }).first
    }
    
    func getCurrent() -> Wallet? {
        if let curWallet = currentWallet {
            return curWallet
        }
        return nil
    }
}
