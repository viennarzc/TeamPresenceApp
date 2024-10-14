//
//  TeamPresenceApp.swift
//  TeamPresence
//
//  Created by Viennarz Curtiz on 10/9/24.
//

import SwiftUI

@main
struct TeamPresenceApp: App {
    init() {
       #if DEBUG
       AppConfig.AppWrite.configure(
           endpoint: "https://cloud.appwrite.io/v1",
           allowSelfSigned: true
       )
       #else
       AppConfig.AppWrite.configure(
           endpoint: "https://cloud.appwrite.io/v1",
           allowSelfSigned: false
       )
       #endif
   }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
