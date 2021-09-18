//
//  ChatViewModel.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 03/06/2021.
//

import SwiftUI
import Firebase

class ChatViewModel: ObservableObject {
    let user: User
    @Published var messages = [Message]()
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let uid = user.id else { return }
        
        let query = COLLECTION_MESSAGES.document(currentUid).collection(uid)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }            
            self.messages.append(contentsOf: changes.compactMap({ try? $0.document.data(as: Message.self) })) 
        }
    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        guard let uid = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(uid).document()
        let receivingUserRef = COLLECTION_MESSAGES.document(uid).collection(currentUid)
        let receivingRecentRef = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        let currentRecentRef =  COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        
        let messageID = currentUserRef.documentID
        
        let data: [String: Any] = ["text": messageText,
                                   "id": messageID,
                                   "fromId": currentUid,
                                   "toId": uid,
                                   "username": user.username,
                                   "profileImageUrl": user.profileImageUrl,
                                   "fullname": user.fullname,
                                   "timestamp": Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        receivingUserRef.document(messageID).setData(data)
        receivingRecentRef.document(currentUid).setData(data)
        currentRecentRef.document(uid).setData(data)
    }
}
