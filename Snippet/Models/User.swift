//
//  User.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 12/03/2024.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
    
    var profileImageUrl: String?
    
    init(id: Int, name: String, username: String, email: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
    }
    
    static let sample: [User] = [
            User(id: 1, name: "John Doe", username: "john_doe", email: "john@example.com"),
            User(id: 2, name: "Jane Smith", username: "jane_smith", email: "jane@example.com"),
            User(id: 3, name: "Alice Johnson", username: "alice_johnson", email: "alice@example.com"),
            User(id: 4, name: "Bob Brown", username: "bob_brown", email: "bob@example.com"),
            User(id: 5, name: "Emma Lee", username: "emma_lee", email: "emma@example.com"),
            User(id: 6, name: "Michael Wilson", username: "michael_wilson", email: "michael@example.com"),
            User(id: 7, name: "Olivia Garcia", username: "olivia_garcia", email: "olivia@example.com"),
            User(id: 8, name: "William Martinez", username: "william_martinez", email: "william@example.com")
        ]
}
