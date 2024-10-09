//
//  MemberCardView.swift
//  TeamPresence
//
//  Created by Viennarz Curtiz on 10/9/24.
//

import SwiftUI

struct MemberCardView: View {
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                HStack {
                    Text("Online 5 mins ago")
                        .font(.caption)
                        .foregroundStyle(.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 4)
                        .background(alignment: .center, content: {
                            Capsule().fill(Color.green)
                        })
                        .padding(.leading)
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.body.bold())
                    .padding(.trailing)
            }
            .frame(height: 44)
            .background(Color.secondary.opacity(0.1))

            Spacer()

            Image(systemName: "person")
                .padding()
                .font(.largeTitle)
                .background(Circle().fill(Color.gray.opacity(0.2)))
                .overlay(alignment: .topTrailing) {
                    ZStack(alignment: .center) {
                        Image(systemName: "bubble.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        Text("😪")
                            .font(.title2)
                    }
                    .offset(x: 30, y: -30)
                }

            VStack {
                Text("Juan Dela Cruz")
                    .multilineTextAlignment(.center)
                    .fontWeight(.medium)

                Text("Software Developer")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack {
                Label {
                    Text(
                        Date.now
                            .formatted(
                                date: .abbreviated,
                                time: .shortened
                            )
                    )
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                } icon: {
                    Image(systemName: "clock.fill")
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 4)
            .padding(.bottom, 8)
        }
    }
}

#Preview {
    ScrollView {
        MemberCardView()
            .frame(width: 300, height: 350)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .background(content: {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray, lineWidth: 0.5)
            })
    }
}
