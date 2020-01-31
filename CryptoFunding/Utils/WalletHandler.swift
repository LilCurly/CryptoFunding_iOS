//
//  WalletHandler.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import Web3swift

class WalletHandler {
    
    static func generateNewWallet(password: String, walletName: String) -> Wallet {
        let repo = WalletRepository.instance
        
        let keystore = try! EthereumKeystoreV3(password: password)!
        let keyData = try! JSONEncoder().encode(keystore.keystoreParams)
        let address = keystore.addresses!.first!.address
        let wallet = Wallet(address: address, data: keyData, name: walletName)
        
        repo.addWallet(wallet: wallet)
        
        return wallet
    }
    
    static func generateWalletFromPrivateKey(privateKey: String, password: String, walletName: String) -> Wallet? {
        let repo = WalletRepository.instance
        
        let formattedKey = privateKey.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let dataKey = Data.fromHex(formattedKey) else {return nil}
        do {
            guard let keystore = try EthereumKeystoreV3(privateKey: dataKey, password: password) else {return nil}
            let keyData = try JSONEncoder().encode(keystore.keystoreParams)
            let address = keystore.addresses!.first!.address
            let wallet = Wallet(address: address, data: keyData, name: walletName)
            
            repo.addWallet(wallet: wallet)
            
            return wallet
        } catch {
            return nil
        }
    }
    
    static func loadCurrentWallet(password: String, walletAddress: String) -> Wallet? {
        let repo = WalletRepository.instance
        
        guard let wallet = repo.getWalletForAddress(address: walletAddress) else {return nil}
        guard let keystore = EthereumKeystoreV3(wallet.data) else {return nil}
        
        if !isPasswordCorrect(keystore: keystore, address: wallet.address, password: password) {
            return nil
        }
        
        repo.setCurrent(wallet: wallet)
        return wallet
    }
    
    static func loadWalletsFromStorage() -> [Wallet] {
        let repo = WalletRepository.instance
        let listOfWallet = repo.getAllWallets()
        
        return listOfWallet
    }
    
    fileprivate static func isPasswordCorrect(keystore: EthereumKeystoreV3, address: String, password: String) -> Bool {
        guard let ethAddress = EthereumAddress(address) else {return false}
        do {
            let _ = try keystore.UNSAFE_getPrivateKeyData(password: password, account: ethAddress)
            return true
        } catch {
            return false
        }
    }
}
