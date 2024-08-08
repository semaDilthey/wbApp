//
//  String+Extension.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 05.06.2024.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: "\(self) couldn't be found in Localizable.strings")
    }
    
}
