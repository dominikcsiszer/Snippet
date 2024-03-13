//
//  PostService.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

class PostService {
    static let shared = PostService()
    
    @MainActor
    func fetchPosts() async throws -> [Post] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let posts = try JSONDecoder().decode([Post].self, from: data)
        
        var postsWithUsers: [Post] = []
            
        for var post in posts {
            do {
                let user = try await UserService.shared.fetchUser(userId: post.userId)
                let comments = try await CommentService.shared.fetchComments(postId: post.id)
                post.user = user
                post.comments = comments
                postsWithUsers.append(post)
            } catch {
                // Handle error while fetching user
                print("Error fetching user for post with ID \(post.id): \(error)")
            }
        }
        
        return postsWithUsers
    }
    
    @MainActor
    func fetchPost(postId: Int) async throws -> Post {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(postId)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(Post.self, from: data)
    }
}
