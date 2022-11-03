# lipa-business-lib-swift
Auxiliary repository used to deliver the Lipa Business Lib (LBL) as a Swift Package

# Example Usage

    import Foundation
    import LipaBusinessLib

    final class LBLService {
    
    private var wallet: LipaBusinessLib.Wallet?
    private var balance: Balance?
    
    func createMnemonic() throws -> [String] {
        return try generateMnemonic()
    }
    
    func createMnemonicAsString() throws -> String {
        let words = try createMnemonic()
        return words.toString()
    }
    
    func createWallet(watchDescriptor: String, electrumUrl: String, network: LipaBusinessLib.Network = .testnet, dbPath: String = "bdk-database") {
        do {
            let walletDbPath = getApplicationsDirectory().appendingPathComponent(dbPath).path
            let config: LipaBusinessLib.Config = .init(electrumUrl: electrumUrl, walletDbPath: walletDbPath, network: network, watchDescriptor: watchDescriptor)
            wallet = try Wallet.init(config: config)
        } catch {
            print("LBLService.createWallet(): ", error.localizedDescription)
        }
    }
    
    func syncBalance() {
        do {
            balance = try wallet?.syncBalance()
        } catch {
            print("LBLService.syncBalance(): ", error.localizedDescription)
        }
    }
    }

    // MARK: - GetMethods
    extension LBLService {
    func getWalletKeys(mnemonic: [String]) throws -> WalletKeys {
        return try deriveKeys(network: Config.lblNetwork, mnemonicString: mnemonic)
    }
    
    func getWallet() -> LipaBusinessLib.Wallet? {
        return wallet
    }
    
    func getBalance() -> UInt64 {
        return balance?.confirmed ?? 0
    }
    }

    // MARK: - KeyPair Operations
    extension LBLService {
    func generateKeyPair() throws -> KeyPair {
        return try generateKeypair()
    }
    
    func sign(message: String, secretKey: String) throws -> String {
        return try LipaBusinessLib.sign(message: message, privateKey: secretKey)
    }
    }


    // MARK: - PrivateMethods
    extension LBLService {
    private func getApplicationsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    }
