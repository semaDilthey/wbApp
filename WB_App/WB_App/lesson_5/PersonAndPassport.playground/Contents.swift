import UIKit

protocol Deinitable: AnyObject {
    func initing()
    func deiniting()
}

extension Deinitable {
    
    func initing() {
        print("Инициализирую \(Self.self) в : \(Unmanaged.passUnretained(self).toOpaque())")
    }
    
    func deiniting() {
        print("\(Self.self) was deinited")
    }
}

final class Person : Deinitable {
    private let name: String
    private let age: Int
    var pasport: Pasport?
    
    init(name: String, age: Int, pasport: Pasport? = nil) {
        self.name = name
        self.age = age
        self.pasport = pasport
        initing()
    }
    
    deinit {
        deiniting()
    }
}

final class Pasport : Deinitable {
    private let series: Int
    private let number: Int
    private let issueDate: Date
    var person: Person?
    
    init(series: Int, number: Int, issueDate: Date, person: Person?) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.person = person
        initing()
    }
    
    deinit {
        deiniting()
    }
}


func testDeinitializtion() {
    print("\nDeiniting in test\n")
    var person: Person? = Person(name: "Vasya", age: 12, pasport: nil)
    var pasport: Pasport? = Pasport(series: 123, number: 456789, issueDate: .now, person: person)
    

    pasport?.person = person
    person = nil
    pasport = nil
}

func testMemoryLeaks() {
    print("\nMemory leaks in test\n")
    var person: Person? = Person(name: "Vasya", age: 12, pasport: nil)
    
    var pasport1: Pasport = Pasport(series: 123, number: 456789, issueDate: .now, person: nil)
    var pasport2: Pasport? = Pasport(series: 123, number: 456789, issueDate: .now, person: nil)
    
    pasport1.person = person
    pasport2?.person = person
    
    person?.pasport = pasport2
    
}

testDeinitializtion()
testMemoryLeaks()


