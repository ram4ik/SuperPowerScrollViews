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
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(item.color.gradient)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
