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
    lazy private var dao: AbstractDao = FakeDao()
    private var currentWallet: Wallet?
    lazy private var loadedWallets = [Wallet]()
    
    private init () {
        
    }
    
    func addWallet(wallet: Wallet) {
        //loadAllWallets()
        let isAlreadyInside = loadedWallets.contains { (wal) -> Bool in
            wal.address == wallet.address
        }
        if !isAlreadyInside {
            let data = WalletMapper.modelToData(model: wallet)
            if dao.saveWallet(wallet: data) {
                loadedWallets.append(wallet)
            }
        }
    }
    
    fileprivate func loadAllWallets() {
        loadedWallets = WalletMapper.dataListToModelList(datas: dao.loadWallets())
    }
    
    func getAllWallets() -> [Wallet] {
        loadAllWallets()
        return loadedWallets
    }
    
    func getWalletForAddress(address: String) -> Wallet? {
        if let data = dao.loadWalletForAddress(address: address) {
            return WalletMapper.dataToModel(data: data)
        }
        return nil
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
    
    func clear() {
        if (dao.clear()) {
            loadedWallets = [Wallet]()
        }
    }
}
