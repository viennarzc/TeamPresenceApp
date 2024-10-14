//
//  LoginView.swift
//  TeamPresence
//
//  Created by Viennarz Curtiz on 10/14/24.
//

import SwiftUI
import Appwrite

class AuthService {
    let client: Client!
    
    init() {
        let appWrite = AppConfig.AppWrite.shared
        client = appWrite!.client
    }
    
    func createUser(email: String) async throws {
        
        let account = Account(client);

        let sessionToken = try await account.createEmailToken(
            userId: ID.unique(),
            email: email
        )

        //save user id in keychain  maybe
        let userId = sessionToken.userId
        debugPrint("user id", userId)
    }
    
}

class LoginViewModel: ObservableObject {
    @Published var emailAddress: String = ""
    lazy var authService = AuthService()
    
    init() {
        
    }
    
    func login() async throws {

        guard !emailAddress.isEmpty else { return }
        
        try await authService.createUser(email: emailAddress)

    }
}

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ScrollView {
            
            VStack(spacing: 24) {
                Spacer().frame(height: 64)
                TextField(
                    text: $viewModel.emailAddress,
                    prompt: Text("Email Address"),
                    axis: .horizontal) {
                        Text("Email Address Field")
                    }
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    Task {
                        try await viewModel.login()
                    }
                    
                } label: {
                    //Should show the OTP screen next
                    Text("Next")
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: 60,
                            alignment: .center
                        )
                }
                .buttonStyle(.borderedProminent)

                
            }
            .padding(.horizontal)
        }
        .navigationTitle("Sign in with email")
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
