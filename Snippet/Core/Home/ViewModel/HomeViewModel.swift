//
//  HomeViewModel.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var posts: [Post] = Post.sample
    
    @MainActor
    func fetchPosts() async {
        defer { isLoading = false }
        do {
            isLoading = true
            // DEBUG: Delay
//            let duration = Duration(secondsComponent: 4, attosecondsComponent: 0)
//            try await Task.sleep(for: duration)
            posts = try await PostService.shared.fetchPosts()
        } catch {
            print("DEBUG: Error while fetching posts: \(error.localizedDescription)")
        }
    }
}
