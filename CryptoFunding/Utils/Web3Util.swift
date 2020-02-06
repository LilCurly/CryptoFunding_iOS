//
//  Web3.swift
//  CryptoFunding
//
//  Created by student5308 on 04/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import Web3swift

class Web3Util {
    static let instance = Web3.InfuraRopstenWeb3()
    
    private init() {
        
    }
    
    static func setCurrentKeystore(keystore: EthereumKeystoreV3) {
        let keystoreManager = KeystoreManager([keystore])
        instance.addKeystoreManager(keystoreManager)
    }
    
    static func getTransactionReceipt(hash: String) {
        DispatchQueue.global(qos: .userInitiated).async {
            var result: TransactionReceipt? = nil
            while result == nil {
                do {
                    result = try instance.eth.getTransactionReceipt(hash)
                    if let contractAddress = result?.contractAddress {
                        print(contractAddress.address)
                    }
                } catch {
                    
                }
            }
        }
    }
}
