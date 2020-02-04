//
//  Wallet.swift
//  CryptoFunding
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import Web3swift

struct Wallet {
    let address: String
    let data: Data
    let name: String
    
    public func getPrivateKey(password: String) -> Data? {
        let ethAddress = getAddress()
        if let workingAddress = ethAddress {
            do {
                guard let keystore = EthereumKeystoreV3(data) else {return nil}
                let pkData = try keystore.UNSAFE_getPrivateKeyData(password: password, account: workingAddress)
                return pkData
            } catch {
                return nil
            }
        }
        return nil
    }
    
    public func getAddress() -> EthereumAddress? {
        return EthereumAddress(address)
    }
    
    public func getKeystore() -> EthereumKeystoreV3? {
        let keystore = EthereumKeystoreV3(data)
        if let workingKeystore = keystore {
            return workingKeystore
        }
        return nil
    }
}
