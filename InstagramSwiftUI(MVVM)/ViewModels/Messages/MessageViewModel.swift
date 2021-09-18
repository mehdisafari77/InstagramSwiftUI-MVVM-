//
//  MessageViewModel.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 03/06/2021.
//

import Foundation

struct MessageViewModel {
    let message: Message
    
    var currentUid: String { return AuthViewModel.shared.userSession?.uid ?? "" }
    
    
    
    var isFromCurrentUser: Bool { return message.fromId == currentUid }
}
