//
//  UserRow.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 12/03/2024.
//

import SwiftUI

struct UserRow: View {
    let user: User

    var body: some View {
        HStack(spacing: 16) {
            // Profile Image
            ProfileCircularImageView(user: user, size: .small)

            // User Information
            VStack(alignment: .leading, spacing: 4) {
                Text(user.name)
                    .font(.headline)
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
//        .shadow(radius: 2)
    }

    // Function to get the initials from the user's fullname
    private func getInitials(from fullname: String) -> String {
        let names = fullname.split(separator: " ")
        if let first = names.first, let last = names.last {
            return String(first.prefix(1) + last.prefix(1))
        }
        return ""
    }
}

#Preview {
    UserRow(user: User.sample[0])
}
