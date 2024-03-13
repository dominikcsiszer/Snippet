//
//  PostViewModel.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

class PostViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var post: Post = Post.sample[0]
    
    @MainActor
    func fetchPost(postId: Int) async {
        defer { isLoading = false }
        do {
            isLoading = true
            // DEBUG: Delay
//            let duration = Duration(secondsComponent: 4, attosecondsComponent: 0)
//            try await Task.sleep(for: duration)
            post = try await PostService.shared.fetchPost(postId: postId)
        } catch {
            print("DEBUG: Error while fetching posts: \(error.localizedDescription)")
        }
    }
}
