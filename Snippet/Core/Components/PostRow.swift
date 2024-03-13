//
//  PostRow.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import SwiftUI

struct PostRow: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                ProfileCircularImageView(user: post.user, size: .xSmall)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(post.user?.name ?? "")
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("10 min")
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text(post.body)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 2)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "bubble.right")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                                .foregroundColor(.black)
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                                .foregroundColor(.black)
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    
                    Text("\(post.comments?.count ?? 0) comment • 0 like")
                        .font(.footnote)
                        .foregroundColor(Color(.systemGray2))
                }
            }
            .padding(.horizontal)
            }
        
        Divider()
    }
}

#Preview {
    PostRow(post: Post.sample[0])
}
