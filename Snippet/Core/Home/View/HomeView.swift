//
//  HomeView.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.posts) { post in
                    LazyVStack(alignment: .leading) {
                        NavigationLink(value: post) {
                            PostRow(post: post)
                                .redactedShimmer(condition: viewModel.isLoading)
                        }
                        .disabled(viewModel.isLoading)
                    }
                }
            }
            .navigationTitle("Posts")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: Post.self, destination: { post in
                PostView(post: post)
            })
            .foregroundColor(.black)
            .refreshable {
                await viewModel.fetchPosts()
            }
        }
        .task {
            await viewModel.fetchPosts()
        }
    }
}

#Preview {
    HomeView()
}
