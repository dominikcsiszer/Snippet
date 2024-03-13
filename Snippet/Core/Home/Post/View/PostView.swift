//
//  PostView.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import SwiftUI

struct PostView: View {
    let post: Post
    var body: some View {
        ScrollView(showsIndicators: false) {
            PostRow(post: post)
            
            LazyVStack {
                ForEach(post.comments ?? []) { comment in
                    CommentRow(comment: comment)
                }
            }
        }
    }
}

#Preview {
    PostView(post: Post.sample[0])
}
