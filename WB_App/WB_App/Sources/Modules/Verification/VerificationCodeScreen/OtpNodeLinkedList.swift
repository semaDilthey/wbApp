
import Foundation

final class OtpNode {
    var value: String
    var pin: Pin
    var next: OtpNode?
    var previous: OtpNode?
    
    init(value: String, pin: Pin, next: OtpNode? = nil, previous: OtpNode? = nil) {
        self.value = value
        self.pin = pin
        self.next = next
        self.previous = previous
    }
}

final class OtpCodeLinkedList {
    var head: OtpNode?
    var tail: OtpNode?
    
    func addNode(_ node: OtpNode) {
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    func getPin(pin: Pin) -> OtpNode? {
        var currentPin = head
        var index = Pin.allCases.firstIndex(of: .one)
        
        while let node = currentPin, index != Pin.allCases.firstIndex(of: pin) {
            currentPin = node.next
            index = index! + 1
        }
        return currentPin
    }
}
