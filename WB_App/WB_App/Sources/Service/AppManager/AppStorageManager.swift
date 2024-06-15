//
//  AppManager.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import SwiftUI

fileprivate typealias K = AppStorageKeys

enum AppStorageKeys: String {
    case isNewUser
    case isAuthorized
}

final class AppStorageManager: NSObject {
    
    static let shared = AppStorageManager()
    private let userDefaults : UserDefaults
    
    private override init() {
        userDefaults = UserDefaults.standard
    }
    
    func markAsLaunched() {
        setValue(true, for: .isNewUser)
    }
    
    func isNewUser() -> Bool {
        getBool(for: .isNewUser)
    }
}

extension AppStorageManager {
    
    func setValue<`Type`>(_ value: `Type`, for key: AppStorageKeys) {
        userDefaults.set(value, forKey: key.rawValue)
    }
    
    func getBool(for key: AppStorageKeys) -> Bool {
        return userDefaults.bool(forKey: key.rawValue)
    }
    
}
