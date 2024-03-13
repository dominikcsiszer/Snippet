//
//  userService.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

class UserService {
    static let shared = UserService()
    
    @MainActor
    func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
    
    @MainActor
    func fetchUser(userId: Int) async throws -> User {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userId)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(User.self, from: data)
    }
}
