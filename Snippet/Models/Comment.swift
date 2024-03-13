//
//  Comment.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

struct Comment: Identifiable, Codable, Hashable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
    
    init(id: Int, postId: Int, name: String, email: String, body: String) {
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
    
    static let sample: [Comment] = [
        Comment(id: 1, postId: 1, name: "John", email: "john@example.com", body: "Great post!"),
        Comment(id: 2, postId: 1, name: "Alice", email: "alice@example.com", body: "I found this really helpful."),
        Comment(id: 3, postId: 1, name: "Bob", email: "bob@example.com", body: "Thanks for sharing."),
        Comment(id: 4, postId: 1, name: "Emma", email: "emma@example.com", body: "This is amazing!"),
        Comment(id: 5, postId: 1, name: "Sam", email: "sam@example.com", body: "I have a question about this.")
    ]
}
