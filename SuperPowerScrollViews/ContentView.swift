//
//  ContentView.swift
//  SuperPowerScrollViews
//
//  Created by Ramill Ibragimov on 9/29/23.
//

import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [
        Item(color: .teal),
        Item(color: .orange),
        Item(color: .yellow),
        Item(color: .pink),
        Item(color: .purple),
        Item(color: .green),
        Item(color: .gray),
        Item(color: .red)
    ]
}

struct ContentView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal, 
                                                count: verticalSizeClass == .regular ? 2 : 4,
                                                spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.4)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}
