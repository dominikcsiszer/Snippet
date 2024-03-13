//
//  ProfileView.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 12/03/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("Hello \(user.name)")
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProfileView(user: User.sample[0])
}
