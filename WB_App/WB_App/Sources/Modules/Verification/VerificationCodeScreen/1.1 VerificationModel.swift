//
//  VerificationModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 15.07.2024.
//

import Foundation
import SwiftUI

struct VerificationModel {
    
    var phoneNumber: String = "+79676159999"
    /// Код, который должен прийти пользователю на номер телефона
    var code : [String] = [] { didSet { print(code) } }
    /// Код, который пользователь ввел в текстфилд
    var enteredCode : [String] = []
    /// Количество ячеек/ цифр пин кода
    let numberOfPins = 4
}

extension VerificationModel {
    
    mutating func generateCode() {
        let chars = Array(0...9)
        var digitsNumber = 0
        var generatedCode : [String] = []
        while digitsNumber < 4 {
            digitsNumber += 1
            generatedCode.append(String(chars.randomElement()!))
        }
        code = generatedCode
    }
}
