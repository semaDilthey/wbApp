//
//  ProfileSummary.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 06.07.2024.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    @Environment(ModelData.self) var modelData

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                profileData
                Divider()
                badgesCollection
                Divider()
                hikingGraphs
            }
        }
    }
}

extension ProfileSummary {
    
    var profileData: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(profile.username)
                .bold()
                .font(.title)


            Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
            Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
            Text("Goal Date: ") + Text(profile.goalDate, style: .date)
        }
       
    }
    
    var badgesCollection: some View {
        VStack(alignment: .leading) {
            Text("Completed Badges")
                .font(.headline)


            ScrollView(.horizontal) {
                HStack {
                    HikeBadge(name: "First Hike")
                    HikeBadge(name: "Earth Day")
                        .hueRotation(Angle(degrees: 90))
                    HikeBadge(name: "Tenth Hike")
                        .grayscale(0.5)
                        .hueRotation(Angle(degrees: 45))
                }
                .padding(.bottom)
            }
        }
    }
    
    var hikingGraphs: some View {
        VStack(alignment: .leading) {
            Text("Recent Hikes")
                .font(.headline)


            HikeView(hike: modelData.hikes[0])
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.mockProfile)
        .environment(ModelData())
}
