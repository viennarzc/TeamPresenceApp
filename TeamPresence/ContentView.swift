//
//  ContentView.swift
//  TeamPresence
//
//  Created by Viennarz Curtiz on 10/9/24.
//

import SwiftUI

struct ContentView: View {
    private var columns: [GridItem] = [
        .init(.adaptive(minimum: 120, maximum: 300), spacing: 8),
        .init(.adaptive(minimum: 120, maximum: 300), spacing: 8),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(0 ..< 10) { _ in

                    MemberCardView()
                        .frame(height: 280)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .background(content: {
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 0.5)
                        })
                }
            }
            .padding(.horizontal)
        }
        .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
