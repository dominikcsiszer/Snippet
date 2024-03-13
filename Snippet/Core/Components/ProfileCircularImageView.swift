//
//  ProfileCircularImage.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import SwiftUI
import Kingfisher

enum ProfileImageSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall: return 28
        case .xSmall: return 32
        case .small: return 40
        case .medium: return 48
        case .large: return 64
        case .xLarge: return 80
        }
    }
}

struct ProfileCircularImageView: View {
    let user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
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
    ProfileCircularImageView(user: User.sample[0], size: .medium)
}
