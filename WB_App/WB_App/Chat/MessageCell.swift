//
//  MessageCell.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 08.08.2024.
//

import SwiftUI
import ExyteChat

enum ConversationSide {
    case sender, interloculor
}

struct MessageCell: View {
    
    let type: ConversationSide
    var message: Message
    
    private var cellColor: Color {
        type == .interloculor ? .pink : Color.Brand.default
    }
    
    private var textColor: Color {
        type == .interloculor ? Color.Neutural.text : .white
    }
    
    private var cornerRadii : RectangleCornerRadii {
        RectangleCornerRadii(topLeading: 16,
                             bottomLeading: type == .interloculor ? 0 : 16,
                             bottomTrailing: type == .interloculor ? 16 : 0,
                             topTrailing: 16)
    }
    
    private var alignment: HorizontalAlignment {
        type == .interloculor ? .leading : .trailing
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: alignment, spacing: 8) {
                Text(message.text)
                    .font(.wbFont(.body2))
                    .foregroundStyle(textColor)
                if !message.attachments.isEmpty {
                    ForEach(message.attachments, id: \.id) { attachment in
                        AsyncImage(url: attachment.thumbnail)
                    }
                }
                HStack {
                    Text(message.createdAt, style: .time)
                    if message.status == .read {
                        Circle().fill().frame(width: 1.5, height: 1.5)
                        Text("Прочитано")
                    }
                }
                .font(.wbFont(.metadata2))
                .foregroundStyle(textColor)
            }
            .padding()
        }
        .background(
            UnevenRoundedRectangle(cornerRadii: cornerRadii)
                .fill(cellColor)
            )
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity, alignment: Alignment(horizontal: alignment, 
                                                         vertical: .center))
    }
}

#Preview {
    MessageCell(type: .sender,
                message: .init(id: "1", user: .init(id: "1", name: "Pablo", avatarURL: nil, isCurrentUser: true), status: .read, text: "Годзилла топчик, позже запишу голосом"))
}
