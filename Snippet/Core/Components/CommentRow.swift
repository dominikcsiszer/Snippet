//
//  CommentRow.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import SwiftUI

struct CommentRow: View {
    let comment: Comment
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                ProfileCircularImageView(user: nil, size: .xSmall)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(comment.name)
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
                        Text(comment.body)
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
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    
                    Text("0 like")
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
    CommentRow(comment: Comment.sample[0])
}
