//
//  ButtonModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import Foundation

struct ButtonModel {
    var imageName: String
    var action: () -> Void
}

extension ButtonModel: Hashable {
    static func == (lhs: ButtonModel, rhs: ButtonModel) -> Bool {
            lhs.imageName == rhs.imageName
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(imageName)
        }
}
