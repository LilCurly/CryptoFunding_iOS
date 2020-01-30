//
//  FakeDao.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

class FakeDao: AbstractDao {
    private var listOfWallets = [Wallet]()
    
    func saveWallet(wallet: Wallet) -> Bool {
        listOfWallets.append(wallet)
        return true
    }
    
    func loadWalletForAddress(address: String) -> Wallet? {
        let result = listOfWallets.first { (wal) -> Bool in
            address == wal.address
        }
        return result
    }
    
    func loadWallets() -> [Wallet] {
        return listOfWallets
    }
    
}
