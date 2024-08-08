//
//  ChatError.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.08.2024.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
