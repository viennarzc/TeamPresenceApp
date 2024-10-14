//
//  ContentView.swift
//  TeamPresence
//
//  Created by Viennarz Curtiz on 10/9/24.
//

import SwiftUI
import Appwrite

struct ContentView: View {
    @State private var isPresentingLogin: Bool = false
    
    private var columns: [GridItem] = [
        .init(
            .adaptive(minimum: 120, maximum: 300),
            spacing: 8,
            alignment: .center
        ),
        .init(
            .adaptive(minimum: 120, maximum: 300),
            spacing: 8,
            alignment: .center
        ),
    ]

    var body: some View {
        TabView {
            NavigationStack {
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
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            isPresentingLogin = true
                            
                        } label: {
                            Text("Login")
                        }

                    }
                }
            }
            .tabItem {
                Label("Space", systemImage: "person.3")
            }
        }
        .sheet(isPresented: $isPresentingLogin, content: {
            LoginView()
        })
        .preferredColorScheme(.light)
        .task {
            let client = Client()
                .setEndpoint("https://cloud.appwrite.io/v1")
                .setProject("66fddd7e002df61621b7")
                .setSelfSigned(true) // For self signed certificates, only use for development

                let databases = Databases(client)

                do {
                    
                    let account = Account(client)

                    let user = try await account.get()
                    
                    debugPrint("Docs \(user)")
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

#Preview {
    ContentView()
}
