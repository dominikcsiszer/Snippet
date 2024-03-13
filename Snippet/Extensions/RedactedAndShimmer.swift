//
//  RedactAndShimmer.swift
//  SkeletonLoad
//
//  Created by Csiszér Dominik on 13/03/2024.
//

import Foundation
import SwiftUI

public struct RedactedAndShimmerModifier: ViewModifier {
    private let condition: Bool
    
    init(condition: Bool) {
        self.condition = condition
    }
    
    public func body(content: Content) -> some View {
        if condition {
            content
                .redacted(reason: .placeholder)
                .shimmering()
        } else {
            content
        }
    }
}

extension View {
    public func redactedShimmer(condition: Bool) -> some View {
        modifier(RedactedAndShimmerModifier(condition: condition))
    }
}
