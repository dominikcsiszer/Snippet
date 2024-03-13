//
//  HomeView.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 12/03/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()
    
    @State private var searchText = ""
    
    var filteredUsers: [User] {
            if searchText.isEmpty {
                return viewModel.users
            } else {
                return viewModel.users.filter { user in
                    user.name.localizedCaseInsensitiveContains(searchText) ||
                    user.email.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                if filteredUsers.isEmpty {
                    HStack {
                        Spacer()
                        
                        Text("No users found")
                            .padding()
                        
                        Spacer()
                    }
                } else {
                    ForEach(filteredUsers) { user in
                        LazyVStack {
                            NavigationLink(value: user) {
                                UserRow(user: user)
                                    .padding(.horizontal, 16)
                                    .redactedShimmer(condition: viewModel.isLoading)
                            }
                            .disabled(viewModel.isLoading)
                        }
                    }
                }
            }
            .refreshable {
                Task { await viewModel.fetchUsers() }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Users")
            .foregroundColor(.black)
            .background {
                Color(uiColor: UIColor.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
            }
            .searchable(text: $searchText, prompt: "Search...")
            .tint(.none)
        }
        .task { await viewModel.fetchUsers() }
    }
}

#Preview {
    ExploreView()
}
