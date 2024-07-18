//
//  SocialNetworks.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 14.06.2024.
//

import Foundation

enum SocialNetworks: CaseIterable {
    case twitter
    case instagram
    case linkedIn
    case facebook
}

extension SocialNetworks {
    
    var icon : String {
        switch self {
        case .twitter:
            return WBIcons.Socials.twitter
        case .instagram:
            return WBIcons.Socials.instagram
        case .linkedIn:
            return WBIcons.Socials.linkedInt
        case .facebook:
            return WBIcons.Socials.facebook
        }
    }
}
