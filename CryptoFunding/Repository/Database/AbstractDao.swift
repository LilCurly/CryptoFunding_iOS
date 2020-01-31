//
//  AbstractDao.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation

protocol AbstractDao {
    func saveWallet(wallet: WalletData) -> Bool
    func loadWalletForAddress(address: String) -> WalletData?
    func loadWallets() -> [WalletData]
    func clear() -> Bool
}
