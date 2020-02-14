//
//  Web3.swift
//  CryptoFunding
//
//  Created by student5308 on 04/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import web3swift

class Web3Util {
    static let instance = Web3.InfuraRopstenWeb3(accessToken: "1e0e99dc4344427f903cedbb21639caa")
    
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
    
    static func estimateGasCost(tx: WriteTransaction) -> String? {
        do {
            let gasPrice = try instance.eth.getGasPrice()
            let estimatedGas = try tx.estimateGas() * gasPrice
            return Web3.Utils.formatToEthereumUnits(estimatedGas, toUnits: .eth, decimals: 6, decimalSeparator: ".")
        } catch {
            print(error)
            return nil
        }
    }
    
    static func writeTransaction(tx: WriteTransaction, password: String) -> TransactionSendingResult? {
        do {
            return try tx.send(password: password)
        } catch {
            print(error)
            return nil
        }
    }
}
