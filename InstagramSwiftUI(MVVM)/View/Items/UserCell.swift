//
//  UserCell.swift
//  InstagramSwiftUI(MVVM)
//
//  Created by Mehdi MMS on 21/05/2021.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }.foregroundColor(.black)
            
            Spacer()
        }
    }
}

