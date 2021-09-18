//
//  InstagramSwiftUI_MVVM_App.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 20/05/2021.
//

import SwiftUI
import Firebase

@main
struct InstagramSwiftUI_MVVM_App: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
