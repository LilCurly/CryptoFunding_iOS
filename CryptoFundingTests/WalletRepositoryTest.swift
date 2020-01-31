//
//  WalletRepositoryTest.swift
//  CryptoFundingTests
//
//  Created by student5308 on 30/01/2020.
//  Copyright © 2020 student5308. All rights reserved.
//

import Foundation
import XCTest
@testable import CryptoFunding

class WalletRepositoryTest: XCTestCase {
    
    override func setUp() {
        WalletRepository.instance.clear()
    }
    
    func testAddingWalletAddsItToDAO() {
        let repo = WalletRepository.instance
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        XCTAssertTrue(repo.getAllWallets().count == 1)
    }
    
    func testAddingTwoWalletsAddsThemToDAO() {
        let repo = WalletRepository.instance
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        repo.addWallet(wallet: Wallet(address: "1111", data: Data(), name: "test"))
        XCTAssertTrue(repo.getAllWallets().count == 2)
    }
    
    func testAddingTwoWalletsWithSameAddressFailsToAddThemToDAO() {
        let repo = WalletRepository.instance
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        XCTAssertTrue(repo.getAllWallets().count == 1)
    }
    
    func testGettingWalletForAddressReturnsCorrectWallet() {
        let repo = WalletRepository.instance
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        let wal = repo.getWalletForAddress(address: "0000")
        XCTAssertNotNil(wal)
        XCTAssertTrue(wal?.address == "0000")
    }
    
    func testGettingWalletForWrongAddressReturnsNoWallet() {
        let repo = WalletRepository.instance
        repo.addWallet(wallet: Wallet(address: "0000", data: Data(), name: "test"))
        let wal = repo.getWalletForAddress(address: "1111")
        XCTAssertNil(wal)
    }
    
    func testSettingCurrentWalletSetsItCorrectly() {
        let repo = WalletRepository.instance
        let wal = Wallet(address: "0000", data: Data(), name: "test")
        repo.addWallet(wallet: wal)
        repo.setCurrent(wallet: wal)
        XCTAssertNotNil(repo.getCurrent)
        XCTAssertTrue(repo.getCurrent()?.address == "0000")
    }
}
