//
//  ChatScreen.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.08.2024.
//

import SwiftUI
import ExyteChat

struct ChatScreen: View {
    
    @StateObject private var vm: ChatExampleViewModel
    
    init(viewModel: ChatExampleViewModel = ChatExampleViewModel()) {
          _vm = StateObject(wrappedValue: viewModel)
      }
    
    var body: some View {
        VStack {
            navBar
            ChatView(messages: vm.messages, chatType: .conversation) { draft in
                vm.send(draft: draft)
            } messageBuilder: { message, _, _, _, _, _ in
                
                switch message.user.id {
                case "1":
                    MessageCell(type: .sender, message: message)
                default:
                    MessageCell(type: .interloculor, message: message)
                }
                
            } inputViewBuilder: { text, _, _, inputViewStyle, inputViewActionClosure, _ in
                
                Group {
                    switch inputViewStyle {
                    case .message:
                        chatInputView(text: text,
                                      attach: { inputViewActionClosure(.add) },
                                      send: { inputViewActionClosure(.send) })
                    case .signature:
                        EmptyView()
                    }
                }
                
            } .headerBuilder { date in
                dateSectionView(date)
            }
            .enableLoadMore(pageSize: 3) { message in
                vm.loadMoreMessage(before: message)
            }
            .onAppear(perform: vm.onStart)
            .onDisappear(perform: vm.onStop)

        }
        .padding(.horizontal)
    }
    
    // NAVIGATION BAR
    private var navBar: some View {
        HStack {
            Button {
                print("yay")
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text(vm.chatTitle)
                        .font(.wbFont(.subheading1))
                }
                .foregroundStyle(Color.Neutural.text)
            }
            Spacer()
            HStack {
                Button {
                    print("Search tapped")
                } label: {
                    Image(WBIcons.NavBar.search)
                }
                Button {
                    print("Burger tapped")
                } label: {
                    Image(WBIcons.NavBar.hamburger)
                }
            }
        }
    }
    
    //CHAT INPUT BOTTOM VIEW
    private func chatInputView(text: Binding<String>, 
                               attach: @escaping () -> Void,
                               send: @escaping () -> Void) -> some View {
        HStack {
            
            Button {
                attach()
                print("Add tapped")
            } label: {
                Image(systemName: "plus")
                    .foregroundStyle(Color.Neutural.disabled)
            }
            .padding()
            
            TextField("Chat input", text: text, prompt: Text("Начните общение..."))
                .font(.wbFont(.body1))
                .tint(Color.Neutural.text)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .foregroundStyle(Color.Neutural.secondaryBG)
                    )
            
            Button {
                send()
                print("Send tapped")
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(Color.Brand.default)
            }
            .padding()
        }
    }
    
    // DATE SECTION
    private func dateSectionView(_ date: Date) -> some View {
        ZStack {
            Divider()
            Rectangle().fill(Color.white)
                .frame(width: 120)
            Text(formatDate(date))
                .foregroundStyle(Color.Neutural.disabled)
                .font(.wbFont(.metadata1))
        }
        .padding(.vertical)
    }
}

extension ChatScreen {
    
    private func formatDate(_ date: Date) -> String {
        return "\(date)"
    }
}

#Preview {
    ChatScreen()
}
