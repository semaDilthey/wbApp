//
//  MAnchoerKey.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 17.06.2024.
//

import SwiftUI

struct MAnchoerKey: PreferenceKey {
    
    static var defaultValue: [String: Anchor<CGRect>] = [:]
    
    static func reduce(value: inout [String : Anchor<CGRect>],
                       nextValue: () -> [String : Anchor<CGRect>]) {
        value.merge(nextValue()) { $1 }
    }
}
