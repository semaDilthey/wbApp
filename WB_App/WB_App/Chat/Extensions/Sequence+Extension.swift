//
//  Sequence+Extension.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.08.2024.
//

import Foundation

extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()

        for element in self {
            try await values.append(transform(element))
        }

        return values
    }
}
