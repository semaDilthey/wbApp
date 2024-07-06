//
//  ProfileEditor.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 06.07.2024.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            usernameRow
            notificationsRow
            seasonPicker
            goalDatePicker
        }
    }
}

extension ProfileEditor {
    var usernameRow: some View {
        HStack {
            Text("Username")
            Spacer()
            TextField("Username", text: $profile.username)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.trailing)
        }
    }
    
    var notificationsRow: some View {
        Toggle(isOn: $profile.prefersNotifications) {
           Text("Enable Notifications")
       }
    }
    
    var seasonPicker: some View {
        Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
           ForEach(Profile.Season.allCases) { season in
               Text(season.rawValue).tag(season)
           }
       }
    }
    
    var goalDatePicker: some View {
        DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
            Text("Goal Date")
        }
    }
    
    private var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
}


#Preview {
    ProfileEditor(profile: .constant(.mockProfile))
}
