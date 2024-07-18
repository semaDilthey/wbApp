
import SwiftUI

final class PinNode {
    @Binding var value: String
    var pin: Pin
    var next: PinNode?
    var previous: PinNode?
    
    init(value: Binding<String>, pin: Pin, next: PinNode? = nil, previous: PinNode? = nil) {
        self._value = value
        self.pin = pin
        self.next = next
        self.previous = previous
    }
}

final class PinsLinkedList {
    var head: PinNode?
    var tail: PinNode?
    
    func addNode(_ node: PinNode) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    func getPin(pin: Pin) -> PinNode? {
        var currentPin = head
        var index = Pin.allCases.firstIndex(of: .one)
        
        while let node = currentPin, index != Pin.allCases.firstIndex(of: pin) {
            currentPin = node.next
            index = index! + 1
        }
        
        return currentPin
    }
    
}

struct PinFieldModel {
    var pinValues: [String]
    
    private var pinsNumber: Int
    private var pinCode : [Pin : String] = .init()

    init(pinsNumber: Int = 4) {
        self.pinValues = Array(repeating: "", count: pinsNumber)
        self.pinsNumber = pinsNumber
    }
    
    func numberOfPins() -> Int {
        pinsNumber
    }

    mutating func updatePincode(pin: Pin, value: String) {
        pinCode[pin] = value
    }
}
