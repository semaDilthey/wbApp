//
//  ChatViewModel.swift
//  WB_App
//
//  Created by Семен Гайдамакин on 07.08.2024.
//

import Foundation
import ExyteChat
import Combine

//final class ChatViewModel: ObservableObject {
//    
//    var id = 2
//    @Published var messages : [Message] = [
//        .init(id: "1", user: .init(id: "1", name: "Pablo", avatarURL: nil, isCurrentUser: true), text: "Hello")
//    ]
//    
//    func send(draft: DraftMessage) {
//        id += 1
//        self.messages.append(Message(id: "\(id)", user: .init(id: "2", name: "Pablo", avatarURL: nil, isCurrentUser: true), text: draft.text))
//    }
//}


final class ChatExampleViewModel: ObservableObject {
    
    @Published var messages: [Message] = []

    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()
    
    var chatTitle: String {
        interactor.otherSenders.count == 1 ? interactor.otherSenders.first!.name : "Group chat"
    }

    init(interactor: ChatInteractorProtocol = MockChatInteractor()) {
        self.interactor = interactor
    }

    func send(draft: DraftMessage) {
        interactor.send(draftMessage: draft)
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
}
