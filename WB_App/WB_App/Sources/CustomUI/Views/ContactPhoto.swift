//
//  ContactPhoto.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.06.2024.
//

import SwiftUI

struct ContactPhoto : View {
    
    var contact: Contact
    var size: CGSize
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            photoImage
            if contact.status == .online {
                if size.width < 60 {
                    onlineIndicator
                }
            }
        }
    }
}

extension ContactPhoto {
    
    private var photoImage : some View {
        ZStack{
            if size.width < 60 {
                storyOverlayCircle
            }

            if size.width >  60 {
                WebImage(urlString: contact.photo)
                    .scaledToFit()
                    .clipShape(.circle)
                    .padding(.horizontal, 86)
            } else {
                WebImage(urlString: contact.photo)
                    .scaledToFill()
                    .frame(width: UIConstants.photoSize,
                           height: UIConstants.photoSize)
                    .clipShape(.rect(cornerRadius: UIConstants.photoRadiis))
            }
        }
    }
    
    private var onlineIndicator : some View {
        Circle()
            .fill(Color.green)
            .frame(width: UIConstants.indicatorSize,
                   height: UIConstants.indicatorSize)
            .overlay {
                Circle()
                    .stroke(Color.white, lineWidth: 2)
            }
    }
    
    private var storyOverlayCircle : some View {
        ZStack {
            Rectangle()
                .fill(contact.hasStory ? Color.gradient(.variant2) : Color.gradient(.clear))
                .frame(width: UIConstants.storyCircleSize,
                       height: UIConstants.storyCircleSize)
                .clipShape(.rect(cornerRadius: UIConstants.storyCircleRadius))
            Rectangle()
                .fill(Color.white)
                .frame(width: UIConstants.storyCircleSize - 4,
                       height: UIConstants.storyCircleSize - 4)
                .clipShape(.rect(cornerRadius: UIConstants.storyCircleRadius - 1))
        }
    }
}

#Preview {
    ContactPhoto(contact: .init(name: "", surname: "", photo: "123", status: .online, hasStory: true),
                 size: CGSize(width: 48, height: 48))
}

fileprivate enum UIConstants {
    static let photoSize: CGFloat = 48
    static let photoRadiis: CGFloat = 16
    
    static let indicatorSize: CGFloat = 12
    
    static let storyCircleSize: CGFloat = 56
    static let storyCircleRadius: CGFloat = 18
}
