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

struct OtpFormFieldView: View {
    
    @State private var pinFieldModel : PinFieldModel = .init()
    @Binding var values : [String]
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
                            updateCode(pinNode: pinNode, of: newValue)
                        }
                }
            }
        }
    }
    
    func updateCode(pinNode: PinNode, of newValue: String) {
        if newValue.count == 1 {
            values.append(newValue)
        } else {
            if !values.isEmpty {
                values.removeLast()
            }
        }
    }
    
    private func movePointerLeftRight(pinNode: PinNode, of newValue: String) {
        if newValue.count == 1 {
            focusedPin = pinNode.next?.pin
        } else if newValue.count == 0 {
            focusedPin = pinNode.previous?.pin
        }
    }
}
