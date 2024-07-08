//
//  OtpFormFieldView.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 06.07.2024.
//

import SwiftUI
import Combine

enum Pin: CaseIterable {
    case one, two, three, four
}

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

struct OtpFormFieldView: View {
    
    @State private var pinFieldModel : PinFieldModel = .init()
    @FocusState private var focusedPin: Pin?
    
    private var pinsLinkedList: PinsLinkedList {
        let linkedList = PinsLinkedList()

        for index in 0..<Pin.allCases.count {
            if index < pinFieldModel.numberOfPins() {
                let pinNode = PinNode(value: $pinFieldModel.pinValues[index], pin: Pin.allCases[index])
                linkedList.addNode(pinNode)
            }
        }
        return linkedList
    }

    var body: some View {
        HStack {
            ForEach(Pin.allCases, id: \.self) { pin in
                if let pinNode = pinsLinkedList.getPin(pin: pin) {
                    OtpCell(value: pinNode.$value)
                        .padding(.horizontal, 20)
                        .focused($focusedPin, equals: pinNode.pin)
                        .onChange(of: pinNode.value) { newValue in
                            movePointerLeftRight(pinNode: pinNode, of: newValue)
                            pinFieldModel.updatePincode(pin: pin, value: pinNode.value)
                        }
                }
            }
        }
    }
    
    private func movePointerLeftRight(pinNode: PinNode, of newValue: String) {
        if newValue.count == 1{
            focusedPin = pinNode.next?.pin
        } else if newValue.count == 0 {
            focusedPin = pinNode.previous?.pin
        }
    }
}

struct OtpCell: View {
    
    @Binding var value : String
    
    var body: some View {
        ZStack {
            backgroundCircle
            oneDigitTextField
        }
        .modifier(OtpModifer(pin: $value))
    }
    
    var backgroundCircle: some View {
        Circle()
            .fill(value == "" ? Color.Neutural.divider : .clear)
            .frame(width: 30, height: 30)
    }
    
    var oneDigitTextField: some View {
        TextField("", text: $value)
            .font(.wbFont(.heading1))
            .tint(.black)
            .keyboardType(.numberPad)
    }
}

struct OtpModifer: ViewModifier {

    @Binding var pin : String

    private let textLimt = 1
    private let aviableSymbols = "1234567890"

    func limitText(_ max : Int) {
        if pin.count > max {
            self.pin = String(pin.prefix(max))
        }
    }
    
    func validateNumbers() {
        self.pin = pin.filter { aviableSymbols.contains($0) }
    }

    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .onReceive(Just(pin)) { _ in
                validateNumbers()
                limitText(textLimt)
            }
            .background(Color.white.cornerRadius(5))
    }
}


//MARK: - Пусть будет, выглядит не очень, но работает и вдруг пригоидтся потом ;D
//struct OtpFormFieldView: View {
//
//    @FocusState var focusedPin: Pin?
//    @State var pinOne: String = ""
//    @State var pinTwo: String = ""
//    @State var pinThree: String = ""
//    @State var pinFour: String = ""
//
//    var body: some View {
//        HStack {
//            OtpCell(value: $pinOne)
//                .onChange(of: pinOne) { newValue in
//                    if newValue.count == 1 {
//                        focusedPin = .two
//                    }
//                }
//                .focused($focusedPin, equals: .one)
//            OtpCell(value: $pinTwo)
//                .onTapGesture {
//                    if pinOne.count == 0 {
//                        focusedPin = .one
//                    }
//                }
//                .onChange(of:pinTwo){newVal in
//                    if (newVal.count == 1) {
//                        focusedPin = .three
//                    } else {
//                        if (newVal.count == 0) {
//                            focusedPin = .one
//                        }
//                    }
//                }
//                .focused($focusedPin, equals: .two)
//            OtpCell(value: $pinThree)
//                .onTapGesture {
//                    if pinTwo.count == 0 {
//                        focusedPin = .one
//                    }
//                }
//                .onChange(of:pinThree){ newVal in
//                    if (newVal.count == 1) {
//                        focusedPin = .four
//                    } else {
//                        if (newVal.count == 0) {
//                            focusedPin = .two
//                        }
//                    }
//                }
//                .focused($focusedPin, equals: .three)
//            OtpCell(value: $pinFour)
//                .onTapGesture {
//                    if pinThree.count == 0 {
//                        focusedPin = .one
//                    }
//                }
//                .onChange(of:pinFour){newVal in
//                    if (newVal.count == 0) {
//                        focusedPin = .three
//                    } else if newVal.count == 1 {
//                        focusedPin = nil
//                    }
//                }
//                .focused($focusedPin, equals: .four)
//
//        }
//    }
//}
