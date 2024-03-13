//
//  CommentService.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

class CommentService {
    static let shared = CommentService()
    
    @MainActor
    func fetchComments(postId: Int) async throws -> [Comment] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/post/\(postId)/comments")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Comment].self, from: data)
    }
}
