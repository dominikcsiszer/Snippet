//
//  Post.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
    
    var user: User?
    var comments: [Comment]?
    
    init(id: Int, userId: Int, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
    
    static let sample: [Post] = [
            Post(id: 1, userId: 1, title: "First Post", body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
            Post(id: 2, userId: 1, title: "Second Post", body: "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas."),
            Post(id: 3, userId: 1, title: "Third Post", body: "Fusce ut ligula eu felis vulputate suscipit."),
            Post(id: 4, userId: 1, title: "Fourth Post", body: "Integer at lectus ac lorem tincidunt varius."),
            Post(id: 5, userId: 1, title: "Fifth Post", body: "Vestibulum lacinia turpis nec ligula mattis, eget ultrices justo dapibus."),
            Post(id: 6, userId: 1, title: "Sixth Post", body: "Sed vestibulum quam et nisi efficitur, at finibus lectus eleifend."),
            Post(id: 7, userId: 1, title: "Seventh Post", body: "Nullam consectetur magna vitae velit elementum, vel faucibus metus scelerisque."),
            Post(id: 8, userId: 1, title: "Eighth Post", body: "Praesent sit amet libero non nulla viverra viverra."),
            Post(id: 9, userId: 1, title: "Ninth Post", body: "Curabitur fringilla orci vel massa fermentum, ac dictum eros placerat."),
            Post(id: 10, userId: 1, title: "Tenth Post", body: "Duis at tortor nec purus ullamcorper lacinia.")
        ]
}
