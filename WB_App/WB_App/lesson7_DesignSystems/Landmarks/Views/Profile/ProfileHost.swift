//
//  ProfileHost.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 06.07.2024.
//

import SwiftUI


struct ProfileHost: View {
    @State private var draftProfile = Profile.mockProfile
    
    @Environment (\.editMode) var editMode
    @Environment(ModelData.self) var modelData

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            navigationBar
            switch editMode?.wrappedValue {
            case .inactive: 
                profileSummary
            default: 
                profileEditor
            }
        }
        .padding()
    }
}

extension ProfileHost {
    
    var navigationBar: some View {
        HStack {
            if editMode?.wrappedValue == .active {
                Button("Cancel", role: .cancel) {
                    draftProfile = modelData.profile
                    editMode?.animation().wrappedValue = .inactive
                }
            }
           Spacer()
           EditButton()
        }
    }
    
    var profileSummary: some View {
        ProfileSummary(profile: modelData.profile)
    }
    
    var profileEditor: some View {
        ProfileEditor(profile: $draftProfile)
            .onAppear {
                 draftProfile = modelData.profile
             }
             .onDisappear {
                 modelData.profile = draftProfile
             }
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}
