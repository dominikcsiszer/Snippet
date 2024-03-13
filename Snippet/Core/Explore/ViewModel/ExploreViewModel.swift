//
//  HomeViewModel.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 12/03/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var users: [User] = User.sample
    
    @MainActor
    func fetchUsers() async {
        defer { isLoading = false }
        do {
            isLoading = true
            // DEBUG: Delay
            let duration = Duration(secondsComponent: 4, attosecondsComponent: 0)
            try await Task.sleep(for: duration)
            users = try await UserService.shared.fetchUsers()
        } catch {
            print("DEBUG: Error while fetching users: \(error.localizedDescription)")
        }
    }
}
