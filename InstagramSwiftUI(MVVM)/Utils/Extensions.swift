//
//  Extensions.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 22/05/2021.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

