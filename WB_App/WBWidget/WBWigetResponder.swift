//
//  UserDataBase.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 20.06.2024.
//

import SwiftUI

final class WidgetResponder {
    
    private init() {}
    
    static let shared = WidgetResponder()
        
    func result() -> String {
        return ["✅", "❌"].randomElement() ?? ""
    }
}


//enum UserDatabaseKeys {
//    static let widget = "group.com.ya.WB-App"
//}
//
//final class UserDatabase {
//    @AppStorage("answer", store: UserDefaults(suiteName: UserDatabaseKeys.widget))
//    private var answer : String = ""
//    
//    func getAnswer() {
//        answer = ["✅", "❌"].randomElement() ?? ""
//    }
//    
//    func result() -> String {
//        return answer
//    }
//}
