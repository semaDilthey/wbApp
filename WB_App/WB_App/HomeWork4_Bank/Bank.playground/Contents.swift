import UIKit


//MARK: - Account

/// Aviable account types for bank clients
enum AccountType {
    case savings
    case card
    case cash
}

struct Account {
    var type: AccountType
    var balance: Decimal
}

extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.type == rhs.type
    }
}

//MARK: - Client

final class Client {
    var id = UUID().uuidString
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
    
    func hasMoney(on account: Account, amount: Decimal) throws -> Bool {
        guard account.balance >= amount else {
            throw BankError.outOfMoney
        }
        return true
    }
}


//MARK: - Bank

protocol Banking {
    func localTransferBetweenAccounts(user: Client, amount: Decimal, from accountType1: AccountType, to accountType2: AccountType) throws
    func transferMoney(from client1: Client, to client2: Client, amount: Decimal) throws
}

final class Bank: Banking {
    
    private var clients : [Client] = []
              
    private let transferService : Transferable
    
    init(transferService: Transferable = TransferService()) {
        self.transferService = transferService
    }
    
    func newClient(client: Client) {
        clients.append(client)
    }
    
    func localTransferBetweenAccounts(user: Client, amount: Decimal, from accountType1: AccountType, to accountType2: AccountType) throws {
        logsBefore()
        try transferService.localTranser(user: user, amount: amount, from: accountType1, to: accountType2)
        logsAfter()
    }
    
    func transferMoney(from client1: Client, to client2: Client, amount: Decimal) throws {
        logsBefore()
        try transferService.transfer(from: client1, to: client2, amount: amount)
        logsAfter()
    }
    
    private func logsBefore() {
        print("Состояние счетов перед транзакцией")
        for client in clients {
            for account in client.accounts {
                print("Клиент: \(client.id) Счет \(account.type) : \(account.balance)")
            }
        }
    }
    
    private func logsAfter() {
        print("Состояние счетов после транзакции")
        for client in clients {
            for account in client.accounts {
                print("Клиент: \(client.id) Счет \(account.type) : \(account.balance)")
            }
        }
    }
}

//MARK: - TransferService

protocol Transferable: AnyObject {
    /// Allow us transfer money between 2 clients via bank
    /// Transactions aviable only for cards
    /// - Parameters:
    ///   - user1: he SEND money
    ///   - user2: he ACCEPT money
    ///   - amount: money amount
    func transfer(from user1: Client, to user2: Client, amount: Decimal) throws
    func localTranser(user: Client, amount: Decimal, from accountType1: AccountType, to accountType2: AccountType) throws
}

final class TransferService : Transferable {
    
    func transfer(from user1: Client, to user2: Client, amount: Decimal) throws {
        guard let index = user1.accounts.firstIndex(where: { $0.type == .card}) else {
            throw BankError.accountNotExist(.card)
        }
        guard let index2 = user2.accounts.firstIndex(where: { $0.type == .card }) else {
            throw BankError.accountNotExist(.card)
        }
        try user1.hasMoney(on: user1.accounts[index], amount: amount)
        try updateBalance(onAccount: &user1.accounts[index], by: amount, type: .send)
        try updateBalance(onAccount: &user2.accounts[index2], by: amount, type: .accept)
    }
    
    func localTranser(user: Client, amount: Decimal, from accountType1: AccountType, to accountType2: AccountType) throws {
        guard let account1Index = user.accounts.firstIndex(where: { $0.type == accountType1 }) else {
            throw BankError.accountNotExist(accountType1)
        }
        guard let account2Index = user.accounts.firstIndex(where: { $0.type == accountType2 }) else {
            throw BankError.accountNotExist(accountType2)
        }
        
        try user.hasMoney(on: user.accounts[account1Index], amount: amount)
        try updateBalance(onAccount: &user.accounts[account1Index], by: amount, type: .send)
        try updateBalance(onAccount: &user.accounts[account2Index], by: amount, type: .accept)
    }
    
    private enum TransferType {
        case send, accept
    }
    
    private func updateBalance(onAccount account: inout Account, by amount: Decimal, type: TransferType) throws {
        guard amount > 0 else {
            throw BankError.negativeAmount
        }
        switch type {
        case .send:
            account.balance -= amount
        case .accept:
            account.balance += amount
        }
    }
}

enum BankError: Error {
    case accountNotExist(AccountType)
    case outOfMoney
    case negativeAmount
    
    var errorDescription: String {
        switch self {
        case .accountNotExist(let accountType):
            return "Счет типа \(accountType) не найден"
        case .outOfMoney:
            return "Недостаточно денег для перевода"
        case .negativeAmount:
            return "Сумма перевода не должна быть меньше 0"
        }
    }
}

var bank = Bank()

var client1 = Client(accounts: [
    Account(type: .card, balance: 300),
    Account(type: .savings, balance: 1000)
])
var client2 = Client(accounts: [
    Account(type: .card, balance: 200),
    Account(type: .savings, balance: 1000)
])

bank.newClient(client: client1)
bank.newClient(client: client2)

do {
    try bank.localTransferBetweenAccounts(user: client1, amount: 200, from: .card, to: .savings)

} catch let error as BankError {
    print(error.errorDescription)
}
