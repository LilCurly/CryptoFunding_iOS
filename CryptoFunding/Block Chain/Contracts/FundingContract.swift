//
//  FundingContract.swift
//  CryptoFunding
//
//  Created by student5308 on 10/02/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import web3swift

class FundingContract {
    private static let abi = "[{\"inputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"constructor\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"askedBallot\",\"outputs\":[],\"payable\":false,\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"currentTask\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"didVote\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"endVote\",\"payable\":false,\"outputs\":[],\"stateMutability\":\"nonpayable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"fund\",\"payable\":true,\"outputs\":[],\"stateMutability\":\"payable\",\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"name\":\"funderProject\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"getAmountCollected\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[],\"name\":\"getCurrentAddressFundedProjects\",\"outputs\":[{\"internalType\":\"uint256[]\",\"name\":\"\",\"type\":\"uint256[]\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[],\"name\":\"getCurrentAddressProjects\",\"outputs\":[{\"internalType\":\"uint256[]\",\"name\":\"\",\"type\":\"uint256[]\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"getDeadlineForCurrentTask\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[],\"name\":\"getNextId\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"getOwner\",\"outputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"_funder\",\"type\":\"address\"}],\"name\":\"getProjectsForFunder\",\"outputs\":[{\"internalType\":\"uint256[]\",\"name\":\"\",\"type\":\"uint256[]\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"_owner\",\"type\":\"address\"}],\"name\":\"getProjectsForOwner\",\"outputs\":[{\"internalType\":\"uint256[]\",\"name\":\"\",\"type\":\"uint256[]\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"getTasks\",\"outputs\":[{\"components\":[{\"internalType\":\"uint256\",\"name\":\"deadline\",\"type\":\"uint256\"},{\"internalType\":\"uint256\",\"name\":\"askedAmount\",\"type\":\"uint256\"}],\"internalType\":\"struct MyContract.Task[]\",\"name\":\"\",\"type\":\"tuple[]\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"getTotalTasks\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"isFinished\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"isFunder\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"isInVote\",\"outputs\":[{\"internalType\":\"bool\",\"name\":\"\",\"type\":\"bool\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"}],\"name\":\"launchBallot\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"totalTasks\",\"type\":\"uint256\"},{\"internalType\":\"uint256[]\",\"name\":\"deadlines\",\"type\":\"uint256[]\"},{\"internalType\":\"uint256[]\",\"name\":\"amounts\",\"type\":\"uint256[]\"}],\"name\":\"launchFundingProject\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"address\",\"name\":\"\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"name\":\"ownerProject\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"\",\"type\":\"uint256\"}],\"name\":\"projects\",\"outputs\":[{\"internalType\":\"address payable\",\"name\":\"owner\",\"type\":\"address\"},{\"internalType\":\"uint256\",\"name\":\"amountCollected\",\"type\":\"uint256\"},{\"internalType\":\"uint256\",\"name\":\"currentAmount\",\"type\":\"uint256\"},{\"internalType\":\"uint256\",\"name\":\"totalTasks\",\"type\":\"uint256\"},{\"internalType\":\"uint256\",\"name\":\"wipTask\",\"type\":\"uint256\"},{\"internalType\":\"bool\",\"name\":\"finished\",\"type\":\"bool\"},{\"internalType\":\"bool\",\"name\":\"inVote\",\"type\":\"bool\"},{\"internalType\":\"uint256\",\"name\":\"totalFunders\",\"type\":\"uint256\"}],\"stateMutability\":\"view\",\"payable\":false,\"type\":\"function\"},{\"inputs\":[{\"internalType\":\"uint256\",\"name\":\"projectId\",\"type\":\"uint256\"},{\"internalType\":\"bool\",\"name\":\"value\",\"type\":\"bool\"}],\"name\":\"vote\",\"outputs\":[],\"stateMutability\":\"nonpayable\",\"payable\":false,\"type\":\"function\"}]"
    
    private static let address = EthereumAddress("0x2D2ebF444d79009382691b62b837AeAD88E77864")!
    
    // Permet la création d'un projet
    static func launchFundingProject(userAddress: EthereumAddress, taskNumber: Int, deadlines: [Int], amountAsked: [Int]) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return contract.write("launchFundingProject", parameters: [taskNumber as AnyObject, deadlines as AnyObject, amountAsked as AnyObject], extraData: Data(), transactionOptions: options)
        }
        return nil
    }
    
    // Permet d'envoyer des fonds vers un projet
    static func fund(userAddress: EthereumAddress, amount: String, projectId: Int) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = Web3.Utils.parseToBigUInt(amount, units: .eth)
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return contract.write("fund", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
        }
        return nil
    }
    
    // Permet de voter
    static func vote(userAddress: EthereumAddress, value: Bool, projectId: Int) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return contract.write("vote", parameters: [projectId as AnyObject, value as AnyObject], extraData: Data(), transactionOptions: options)
        }
        return nil
    }
    
    // Permet de lancer un vote demander par un utilisateur (ayant donné des fonds)
    static func askedBallot(userAddress: EthereumAddress, projectId: Int) -> WriteTransaction? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            return contract.write("askedBallot", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
        }
        return nil
    }
    
    // Permet de récupérer la tâche courrante
    static func currentTask(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("currentTask", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de vérifier si un utilisateur a voté
    static func didVote(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("didVote", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer le montant récupérer au total
    static func getAmountCollected(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getAmountCollected", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer la deadline pour la tâche actuelle d'un projet (sous forme de timestamp à convertir en date)
    static func getDeadlineForCurrentTask(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getDeadlineForCurrentTask", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer l'id du prochain projet (la logique est bizarre, mais il faut incrémenter le résultat pour avoir l'id réelle)
    static func getNextId(userAddress: EthereumAddress) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getNextId", parameters: [AnyObject](), extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer l'addresse du fondateur d'un projet
    static func getOwner(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getOwner", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer le nombre total de tâches
    static func getTotalTasks(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getTotalTasks", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de vérifier si un projet est fini
    static func isFinished(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("isFinished", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de savoir si l'utilisateur a envoyé des fonds
    static func isFunder(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("isFunder", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de savoir si le projet est en vote
    static func isInVote(userAddress: EthereumAddress, projectId: Int) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("isInVote", parameters: [projectId as AnyObject], extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer les projets financés par le portefeuille actuel
    static func getCurrentAddressFundedProjects(userAddress: EthereumAddress) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getCurrentAddressFundedProjects", parameters: [AnyObject](), extraData: Data(), transactionOptions: options)
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
    
    // Permet de récupérer les projets 
    static func getCurrentAddressProjects(userAddress: EthereumAddress) -> Any? {
        let contract = Web3Util.instance.contract(abi, at: address, abiVersion: 2)
        
        if let contract = contract {
            var options = TransactionOptions.defaultOptions
            options.value = .zero
            options.from = userAddress
            options.gasPrice = .automatic
            options.gasLimit = .automatic
            let readTx = contract.read("getCurrentAddressProjects", parameters: [AnyObject](), extraData: Data(), transactionOptions: options)
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
}
