//
//  SimpleTestContract.swift
//  CryptoFunding
//
//  Created by student5308 on 04/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import Web3swift

class SimpleTestContract {
    private static let abi = "[{\"inputs\":[],\"name\":\"getNumber\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"payable\":false,\"stateMutability\":\"view\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"nbr\",\"type\":\"uint256\"}],\"payable\":false,\"name\":\"setNumber\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"}]"
    private static let bytecode = Data.fromHex("60806040526000805534801561001457600080fd5b5060c7806100236000396000f3fe6080604052348015600f57600080fd5b506004361060325760003560e01c80633fb5c1cb146037578063f2c9ecd8146062575b600080fd5b606060048036036020811015604b57600080fd5b8101908080359060200190929190505050607e565b005b60686088565b6040518082815260200191505060405180910390f35b8060008190555050565b6000805490509056fea26469706673582212207a6e65fa75dcfcbb201c169f162ddcdc345923170dc3b1e3dc5cb29995353c5364736f6c63430006010033")!
    
    static func deploy(address: EthereumAddress) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, abiVersion: 2)
        
        if let workingContract = contract {
            var options = TransactionOptions.defaultOptions
            let from = address
            options.value = .zero
            options.from = from
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return workingContract.deploy(bytecode:bytecode , parameters: [AnyObject](), extraData: Data(), transactionOptions: options)!
        }
        return nil
    }
    
    static func getNumber(address: EthereumAddress) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            let readTx = contract.read("getNumber", parameters: [AnyObject](), extraData: Data(), transactionOptions: TransactionOptions.defaultOptions)
            do {
                let result = try readTx?.call()
                return result?["0"]
            } catch {
                print(error)
                return nil
            }
        }
        
        return nil
    }
    
    static func setNumber(userAddress: EthereumAddress, contractAddress: EthereumAddress, parameter: UInt) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, at: contractAddress, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            let from = userAddress
            options.value = .zero
            options.from = from
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return contract.write("setNumber", parameters: [parameter as AnyObject], extraData: Data(), transactionOptions: options)
        }
        return nil
    }
}
