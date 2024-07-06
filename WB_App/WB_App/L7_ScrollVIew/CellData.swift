//
//  CellData.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 28.06.2024.
//

import Foundation

protocol CellDataProvider {
    var id: UUID { get }
    var emoji: String { get }
}

struct CellData: CellDataProvider {
    var id = UUID()
    var emoji: String
    
    init() {
        let emojiRange = 0x1F300...0x1F3F0
        emoji = String(UnicodeScalar(Array(emojiRange).randomElement()!)!)
    }
}
