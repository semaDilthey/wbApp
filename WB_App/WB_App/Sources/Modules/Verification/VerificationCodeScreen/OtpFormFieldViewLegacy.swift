//
//  OtpFormFieldViewLegacy.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 15.07.2024.
//

import SwiftUI

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
