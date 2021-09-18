//
//  LazyView.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 03/06/2021.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
